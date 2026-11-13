import ActivityKit
import SwiftUI
import WidgetKit

/// The rest countdown on the Lock Screen and in the Dynamic Island.
@available(iOS 16.2, *)
struct RestLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: RestActivityAttributes.self) { context in
      RestLockScreenView(context: context)
        .activityBackgroundTint(WidgetPalette.card)
        .activitySystemActionForegroundColor(.white)
    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          Label {
            Text(RestText.title(context))
              .font(.system(size: 14, weight: .semibold))
              .lineLimit(1)
          } icon: {
            Image(systemName: "timer")
          }
          .foregroundColor(WidgetPalette.primaryLight)
        }
        DynamicIslandExpandedRegion(.trailing) {
          RestCountdown(context: context)
            .font(.system(size: 24, weight: .bold).monospacedDigit())
            .foregroundColor(.white)
            .frame(maxWidth: 90, alignment: .trailing)
        }
        DynamicIslandExpandedRegion(.bottom) {
          VStack(alignment: .leading, spacing: 6) {
            Text(context.attributes.workoutName)
              .font(.system(size: 13))
              .foregroundColor(WidgetPalette.textSecondary)
              .lineLimit(1)
            RestProgress(context: context)
          }
        }
      } compactLeading: {
        Image(systemName: "timer").foregroundColor(WidgetPalette.primaryLight)
      } compactTrailing: {
        RestCountdown(context: context)
          .font(.system(size: 14, weight: .semibold).monospacedDigit())
          .foregroundColor(.white)
          .frame(maxWidth: 48)
      } minimal: {
        Image(systemName: "timer").foregroundColor(WidgetPalette.primaryLight)
      }
    }
  }
}

@available(iOS 16.2, *)
private enum RestText {
  static func isOver(_ context: ActivityViewContext<RestActivityAttributes>) -> Bool {
    context.isStale || context.state.endDate <= Date()
  }

  static func title(_ context: ActivityViewContext<RestActivityAttributes>) -> String {
    isOver(context) ? context.state.finishedTitle : context.state.title
  }
}

/// "1:23", counting down on its own without the app running.
@available(iOS 16.2, *)
private struct RestCountdown: View {
  let context: ActivityViewContext<RestActivityAttributes>

  var body: some View {
    if RestText.isOver(context) {
      Text("0:00")
    } else {
      Text(
        timerInterval: context.state.startDate...context.state.endDate,
        countsDown: true
      )
      .multilineTextAlignment(.trailing)
    }
  }
}

@available(iOS 16.2, *)
private struct RestProgress: View {
  let context: ActivityViewContext<RestActivityAttributes>

  var body: some View {
    if RestText.isOver(context) {
      ProgressView(value: 1).tint(WidgetPalette.accent)
    } else {
      ProgressView(
        timerInterval: context.state.startDate...context.state.endDate,
        countsDown: false
      ) {
        EmptyView()
      } currentValueLabel: {
        EmptyView()
      }
      .tint(WidgetPalette.accent)
    }
  }
}

@available(iOS 16.2, *)
private struct RestLockScreenView: View {
  let context: ActivityViewContext<RestActivityAttributes>

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(alignment: .center) {
        VStack(alignment: .leading, spacing: 2) {
          Label {
            Text(RestText.title(context).uppercased())
              .font(.system(size: 12, weight: .bold))
              .kerning(0.6)
          } icon: {
            Image(systemName: "timer")
          }
          .foregroundColor(WidgetPalette.primaryLight)
          Text(context.attributes.workoutName)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.white)
            .lineLimit(1)
        }
        Spacer()
        RestCountdown(context: context)
          .font(.system(size: 34, weight: .bold).monospacedDigit())
          .foregroundColor(.white)
          .frame(maxWidth: 130, alignment: .trailing)
      }
      RestProgress(context: context)
    }
    .padding(16)
  }
}
