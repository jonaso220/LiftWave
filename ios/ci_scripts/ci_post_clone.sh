#!/bin/sh

# Prepare the ephemeral Xcode Cloud environment for this Flutter project.
set -eu

cd "$CI_PRIMARY_REPOSITORY_PATH"

FLUTTER_VERSION="${FLUTTER_VERSION:-3.41.4}"
FLUTTER_HOME="$HOME/flutter"

if [ ! -x "$FLUTTER_HOME/bin/flutter" ]; then
  git clone \
    --branch "$FLUTTER_VERSION" \
    --depth 1 \
    https://github.com/flutter/flutter.git \
    "$FLUTTER_HOME"
fi

export PATH="$FLUTTER_HOME/bin:$PATH"

flutter config --no-analytics
flutter precache --ios
flutter pub get

if ! command -v pod >/dev/null 2>&1; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew install cocoapods
fi

cd ios

# CocoaPods' CDN can briefly rate-limit shared Xcode Cloud runners. Retry the
# same locked install before failing the build; deterministic errors still
# surface after the final attempt.
pod_install_attempt=1
pod_install_max_attempts=4

until pod install; do
  if [ "$pod_install_attempt" -ge "$pod_install_max_attempts" ]; then
    echo "pod install failed after $pod_install_attempt attempts"
    exit 1
  fi

  pod_install_wait_seconds=$((pod_install_attempt * 20))
  echo "pod install failed; retrying in ${pod_install_wait_seconds}s"
  sleep "$pod_install_wait_seconds"
  pod_install_attempt=$((pod_install_attempt + 1))
done
