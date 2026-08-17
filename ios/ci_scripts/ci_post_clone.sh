#!/bin/sh

# Prepare the ephemeral Xcode Cloud environment for this Flutter project.
set -eu

cd "$CI_PRIMARY_REPOSITORY_PATH"

FLUTTER_VERSION="${FLUTTER_VERSION:-3.41.4}"
FLUTTER_HOME="$HOME/flutter"
COCOAPODS_VERSION="${COCOAPODS_VERSION:-1.17.0}"
export COCOAPODS_CDN_MAX_CONCURRENCY="${COCOAPODS_CDN_MAX_CONCURRENCY:-32}"

retry_command() {
  description="$1"
  max_attempts="$2"
  base_wait_seconds="$3"
  shift 3

  attempt=1
  until "$@"; do
    if [ "$attempt" -ge "$max_attempts" ]; then
      echo "$description failed after $attempt attempts"
      return 1
    fi

    wait_seconds=$((attempt * base_wait_seconds))
    echo "$description failed; retrying in ${wait_seconds}s"
    sleep "$wait_seconds"
    attempt=$((attempt + 1))
  done
}

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
  # Installing through RubyGems avoids Homebrew's GitHub release downloads,
  # which can be rate-limited on shared Xcode Cloud runners.
  gem_user_bin="$(ruby -r rubygems -e 'print Gem.user_dir')/bin"
  export PATH="$gem_user_bin:$PATH"
  retry_command \
    "CocoaPods installation" \
    4 \
    20 \
    gem install --user-install --no-document cocoapods -v "$COCOAPODS_VERSION"
fi

cd ios

run_locked_pod_install() {
  pod_executable_path="$(pod env | sed -n 's/^[[:space:]]*Executable Path:[[:space:]]*//p' | head -n 1)"

  if [ -n "$pod_executable_path" ] && [ -f "$pod_executable_path" ]; then
    pod_gem_home="$(dirname "$(dirname "$pod_executable_path")")"
    pod_ruby="$(sed -n '1s/^#!//p' "$pod_executable_path")"

    if [ -x "$pod_ruby" ]; then
      env GEM_HOME="$pod_gem_home" \
        "$pod_ruby" "$CI_PRIMARY_REPOSITORY_PATH/ios/ci_scripts/cocoapods_cdn_mirror.rb" \
        install --deployment
      return
    fi
  fi

  echo "CocoaPods runtime could not be derived; using the installed pod command"
  pod install --deployment
}

# The CDN can also rate-limit dependency downloads. Keep the lockfile as the
# source of truth and retry transient failures before failing the build.
retry_command \
  "CocoaPods dependency installation" \
  6 \
  20 \
  run_locked_pod_install
