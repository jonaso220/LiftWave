import ActivityKit
import Flutter
import Foundation

/// Bridges lib/services/live_activity_service.dart to ActivityKit: the rest
/// countdown as a Live Activity on the Lock Screen and in the Dynamic Island.
enum RestLiveActivityChannel {
  static let name = "com.liftwave.liftwave/live_activity"

  static func register(with messenger: FlutterBinaryMessenger) -> FlutterMethodChannel {
    let channel = FlutterMethodChannel(name: name, binaryMessenger: messenger)
    channel.setMethodCallHandler { call, result in
      guard #available(iOS 16.2, *) else {
        // Live Activities do not exist here; the app carries on without.
        result(false)
        return
      }
      switch call.method {
      case "show":
        guard let args = call.arguments as? [String: Any],
          let startMs = args["startMs"] as? NSNumber,
          let endMs = args["endMs"] as? NSNumber,
          let title = args["title"] as? String,
          let finishedTitle = args["finishedTitle"] as? String,
          let workoutName = args["workoutName"] as? String
        else {
          result(FlutterError(code: "bad_args", message: "show needs times and texts", details: nil))
          return
        }
        result(
          RestLiveActivityController.shared.show(
            start: Date(timeIntervalSince1970: startMs.doubleValue / 1000),
            end: Date(timeIntervalSince1970: endMs.doubleValue / 1000),
            title: title,
            finishedTitle: finishedTitle,
            workoutName: workoutName))
      case "end":
        RestLiveActivityController.shared.end()
        result(true)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    return channel
  }
}

@available(iOS 16.2, *)
final class RestLiveActivityController {
  static let shared = RestLiveActivityController()

  private var current: Activity<RestActivityAttributes>?

  /// Shows the countdown, or moves the one on screen to the new times.
  /// False when the user has Live Activities turned off for the app.
  func show(start: Date, end: Date, title: String, finishedTitle: String, workoutName: String) -> Bool {
    guard ActivityAuthorizationInfo().areActivitiesEnabled else { return false }
    let state = RestActivityAttributes.ContentState(
      startDate: start, endDate: end, title: title, finishedTitle: finishedTitle)
    // Stale once the countdown is over: the activity then says so, since
    // the app may be suspended and unable to end it at that moment.
    let content = ActivityContent(state: state, staleDate: end)

    if let current, current.activityState != .ended, current.activityState != .dismissed,
      current.attributes.workoutName == workoutName
    {
      Task { await current.update(content) }
      return true
    }
    self.end()
    do {
      current = try Activity.request(
        attributes: RestActivityAttributes(workoutName: workoutName),
        content: content,
        pushType: nil)
      return true
    } catch {
      NSLog("RestLiveActivity: could not start (\(error.localizedDescription))")
      return false
    }
  }

  /// Ends every countdown this app has on screen, including one left over
  /// from a launch that was killed.
  func end() {
    current = nil
    // Taken now, so an activity requested right after is not ended too.
    let ending = Activity<RestActivityAttributes>.activities
    guard !ending.isEmpty else { return }
    Task {
      for activity in ending {
        await activity.end(nil, dismissalPolicy: .immediate)
      }
    }
  }
}
