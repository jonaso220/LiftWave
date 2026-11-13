import ActivityKit
import Foundation

/// The rest (or timed set) countdown shown as a Live Activity on the Lock
/// Screen and in the Dynamic Island.
///
/// Compiled into both the app, which starts and ends the activity, and the
/// widget extension, which draws it.
@available(iOS 16.1, *)
struct RestActivityAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    /// The countdown runs from `startDate` to `endDate`.
    var startDate: Date
    var endDate: Date
    /// "Descansando" / "En curso", in the app's language.
    var title: String
    /// Shown once the countdown is over: "Descanso terminado".
    var finishedTitle: String
  }

  /// The workout in progress, e.g. "Full Body".
  var workoutName: String
}
