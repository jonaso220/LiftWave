import Foundation
import WatchConnectivity
import Flutter

/// Bridges Flutter ↔ WatchConnectivity on the iOS side.
class WatchSessionManager: NSObject, WCSessionDelegate {
    static let shared = WatchSessionManager()

    private var channel: FlutterMethodChannel?

    private override init() {
        super.init()
    }

    func setup(with messenger: FlutterBinaryMessenger) {
        NSLog("WatchSessionManager: setup called")
        channel = FlutterMethodChannel(name: "com.liftwave.liftwave/watch", binaryMessenger: messenger)

        channel?.setMethodCallHandler { [weak self] call, result in
            NSLog("WatchSessionManager: received method call: %@", call.method)
            switch call.method {
            case "updateWorkoutState":
                if let args = call.arguments as? [String: Any] {
                    self?.sendToWatch(args)
                }
                result(nil)
            case "updateTimerState":
                if let args = call.arguments as? [String: Any] {
                    self?.sendToWatch(args)
                }
                result(nil)
            case "isWatchReachable":
                result(WCSession.default.isReachable)
            case "isWatchPaired":
                if WCSession.isSupported() {
                    result(WCSession.default.isPaired)
                } else {
                    result(false)
                }
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }

    private func sendToWatch(_ data: [String: Any]) {
        guard WCSession.default.activationState == .activated else {
            NSLog("WatchSessionManager: WCSession not activated, state=%d", WCSession.default.activationState.rawValue)
            return
        }

        NSLog("WatchSessionManager: sending to watch, reachable=%d, paired=%d, keys=%@", WCSession.default.isReachable ? 1 : 0, WCSession.default.isPaired ? 1 : 0, data.keys.joined(separator: ","))

        // Try live message first, fall back to application context
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(data, replyHandler: nil) { error in
                print("iOS sendMessage error: \(error.localizedDescription)")
                // Fallback to application context
                try? WCSession.default.updateApplicationContext(data)
            }
        } else {
            try? WCSession.default.updateApplicationContext(data)
        }
    }

    // MARK: - WCSessionDelegate

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        NSLog("iOS WCSession activated: state=%d, paired=%d, reachable=%d, error=%@", activationState.rawValue, session.isPaired ? 1 : 0, session.isReachable ? 1 : 0, error?.localizedDescription ?? "none")
    }

    func sessionDidBecomeInactive(_ session: WCSession) {}
    func sessionDidDeactivate(_ session: WCSession) {
        WCSession.default.activate()
    }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        // Forward watch commands to Flutter
        DispatchQueue.main.async {
            self.channel?.invokeMethod("watchCommand", arguments: message)
        }
    }
}
