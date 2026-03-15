import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Set up WatchConnectivity bridge using the registrar's messenger
    let registrar = self.registrar(forPlugin: "WatchSessionManager")!
    WatchSessionManager.shared.setup(with: registrar.messenger())

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
