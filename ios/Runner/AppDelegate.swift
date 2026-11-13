import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  private var screenChannel: FlutterMethodChannel?
  private var liveActivityChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Set up WatchConnectivity bridge using the registrar's messenger
    let registrar = self.registrar(forPlugin: "WatchSessionManager")!
    WatchSessionManager.shared.setup(with: registrar.messenger())

    // Keeps the screen on during a workout so the phone does not lock
    // between sets (see lib/services/screen_awake_service.dart).
    let screenRegistrar = self.registrar(forPlugin: "ScreenAwake")!
    let channel = FlutterMethodChannel(
      name: "com.liftwave.liftwave/screen",
      binaryMessenger: screenRegistrar.messenger()
    )
    channel.setMethodCallHandler { call, result in
      guard call.method == "setKeepOn" else {
        result(FlutterMethodNotImplemented)
        return
      }
      UIApplication.shared.isIdleTimerDisabled = (call.arguments as? Bool) ?? false
      result(nil)
    }
    screenChannel = channel

    // The rest countdown as a Live Activity
    // (see lib/services/live_activity_service.dart).
    let liveActivityRegistrar = self.registrar(forPlugin: "RestLiveActivity")!
    liveActivityChannel = RestLiveActivityChannel.register(
      with: liveActivityRegistrar.messenger())

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
