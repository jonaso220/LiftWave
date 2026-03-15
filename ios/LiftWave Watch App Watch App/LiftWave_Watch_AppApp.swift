import SwiftUI
import WatchConnectivity

@main
struct LiftWave_Watch_App_Watch_AppApp: App {
    // Initialize WatchConnectivity early
    let connectivityService = WatchConnectivityService.shared

    init() {
        NSLog("WatchApp: init, WCSession supported=%d", WCSession.isSupported() ? 1 : 0)
        _ = connectivityService // Force initialization
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
