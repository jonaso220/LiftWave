# frozen_string_literal: true

require 'cocoapods'

module LiftWaveCocoaPodsCDNMirror
  RAW_SPECS_PREFIX = 'https://raw.githubusercontent.com/CocoaPods/Specs/master/'
  JSDELIVR_SPECS_PREFIX = 'https://cdn.jsdelivr.net/cocoa/'
  LOCKFILE = Pod::Lockfile.from_file(Pathname(File.expand_path('../Podfile.lock', __dir__)))
  LOCKED_SPEC_VERSIONS = LOCKFILE.pods_by_spec_repo.values.flatten.each_with_object({}) do |name, versions|
    versions[name] = LOCKFILE.version(name)
  end.merge('FlutterMacOS' => Pod::Version.new('3.16.0')).freeze

  # `pod install --deployment` must use the versions in Podfile.lock. Returning
  # only those versions avoids downloading every historical podspec on a clean
  # runner before CocoaPods selects the already-locked one.
  def versions(name)
    locked_version = LOCKED_SPEC_VERSIONS[name]
    return [] unless locked_version

    [locked_version]
  end

  def download_and_save_with_retries_async(partial_url, remote_url, etag, retries = self.class::MAX_NUMBER_OF_RETRIES)
    @liftwave_mirror_attempts ||= {}
    if remote_url.start_with?(RAW_SPECS_PREFIX) && !@liftwave_mirror_attempts[partial_url]
      @liftwave_mirror_attempts[partial_url] = true
      remote_url = remote_url.sub(RAW_SPECS_PREFIX, JSDELIVR_SPECS_PREFIX)
    end

    super(partial_url, remote_url, etag, retries)
  end

  private :download_and_save_with_retries_async
end

Pod::CDNSource.prepend(LiftWaveCocoaPodsCDNMirror)
Pod::Command.run(ARGV)
