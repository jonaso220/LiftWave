import Combine
import Foundation
import WatchConnectivity

/// Manages WatchConnectivity on the watchOS side.
class WatchConnectivityService: NSObject, ObservableObject, WCSessionDelegate {
    static let shared = WatchConnectivityService()

    private override init() {
        super.init()
        NSLog("WatchConnectivityService: init, WCSession.isSupported=%d", WCSession.isSupported() ? 1 : 0)
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
            NSLog("WatchConnectivityService: WCSession.activate() called")
        }
    }

    // MARK: - Send to iPhone

    func sendToPhone(_ message: [String: Any]) {
        guard WCSession.default.isReachable else { return }
        WCSession.default.sendMessage(message, replyHandler: nil) { error in
            print("Watch sendMessage error: \(error.localizedDescription)")
        }
    }

    // MARK: - WCSessionDelegate

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        NSLog("Watch WCSession activated: state=%d, reachable=%d, error=%@", activationState.rawValue, session.isReachable ? 1 : 0, error?.localizedDescription ?? "none")
    }

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        NSLog("Watch didReceiveMessage: keys=%@", message.keys.joined(separator: ","))
        WatchState.shared.updateFromContext(message)
    }

    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String: Any]) {
        NSLog("Watch didReceiveApplicationContext: keys=%@", applicationContext.keys.joined(separator: ","))
        WatchState.shared.updateFromContext(applicationContext)
    }
}
