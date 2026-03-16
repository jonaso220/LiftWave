import WidgetKit
import SwiftUI

// MARK: - Timeline Entry

struct LiftWaveEntry: TimelineEntry {
    let date: Date
    let timerRunning: Bool
    let timerRemaining: Int
    let workoutActive: Bool
    let workoutName: String
    let elapsedSeconds: Int
}

// MARK: - Timeline Provider

struct LiftWaveTimelineProvider: TimelineProvider {
    func placeholder(in context: Context) -> LiftWaveEntry {
        LiftWaveEntry(
            date: .now,
            timerRunning: false,
            timerRemaining: 60,
            workoutActive: false,
            workoutName: String(localized: "watch_workout"),
            elapsedSeconds: 0
        )
    }

    func getSnapshot(in context: Context, completion: @escaping (LiftWaveEntry) -> Void) {
        let state = WatchState.shared
        let entry = LiftWaveEntry(
            date: .now,
            timerRunning: state.timerRunning,
            timerRemaining: state.timerRemaining,
            workoutActive: state.workoutActive,
            workoutName: state.workoutName,
            elapsedSeconds: state.elapsedSeconds
        )
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<LiftWaveEntry>) -> Void) {
        let state = WatchState.shared
        let entry = LiftWaveEntry(
            date: .now,
            timerRunning: state.timerRunning,
            timerRemaining: state.timerRemaining,
            workoutActive: state.workoutActive,
            workoutName: state.workoutName,
            elapsedSeconds: state.elapsedSeconds
        )
        let timeline = Timeline(entries: [entry], policy: .after(.now.addingTimeInterval(60)))
        completion(timeline)
    }
}

// MARK: - Complication Views

struct LiftWaveComplicationCircular: View {
    let entry: LiftWaveEntry

    private var progress: Double {
        guard entry.timerRemaining > 0 else { return 1.0 }
        return Double(60 - entry.timerRemaining) / 60.0
    }

    var body: some View {
        ZStack {
            AccessoryWidgetBackground()

            if entry.workoutActive {
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            } else {
                VStack(spacing: 0) {
                    Image(systemName: "timer")
                        .font(.system(size: 12, weight: .bold))
                    Text(formatTime(entry.timerRemaining))
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .monospacedDigit()
                }
            }
        }
    }

    private func formatTime(_ seconds: Int) -> String {
        let m = seconds / 60
        let s = seconds % 60
        return String(format: "%d:%02d", m, s)
    }
}

struct LiftWaveComplicationRectangular: View {
    let entry: LiftWaveEntry

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: entry.workoutActive
                  ? "figure.strengthtraining.traditional"
                  : "timer")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.cyan)

            VStack(alignment: .leading, spacing: 1) {
                if entry.workoutActive {
                    Text(entry.workoutName.isEmpty ? String(localized: "watch_workout") : entry.workoutName)
                        .font(.system(size: 12, weight: .bold))
                        .lineLimit(1)
                    Text(formatTime(entry.elapsedSeconds))
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundColor(.secondary)
                } else {
                    Text("LiftWave")
                        .font(.system(size: 12, weight: .bold))
                    Text(entry.timerRunning ? "\(String(localized: "watch_resting")) \(formatTime(entry.timerRemaining))" : String(localized: "watch_ready"))
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.secondary)
                }
            }
        }
    }

    private func formatTime(_ seconds: Int) -> String {
        let m = seconds / 60
        let s = seconds % 60
        return String(format: "%d:%02d", m, s)
    }
}

struct LiftWaveComplicationCorner: View {
    let entry: LiftWaveEntry

    var body: some View {
        Image(systemName: "figure.strengthtraining.traditional")
            .font(.system(size: 20, weight: .bold))
            .widgetLabel {
                Text(entry.workoutActive ? String(localized: "watch_training") : "LiftWave")
            }
    }
}

// MARK: - Widget

struct LiftWaveComplicationWidget: Widget {
    let kind = "LiftWaveComplication"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: LiftWaveTimelineProvider()) { entry in
            LiftWaveComplicationEntryView(entry: entry)
        }
        .configurationDisplayName("LiftWave")
        .description(String(localized: "watch_widgetDescription"))
        .supportedFamilies([
            .accessoryCircular,
            .accessoryRectangular,
            .accessoryCorner,
            .accessoryInline
        ])
    }
}

struct LiftWaveComplicationEntryView: View {
    @Environment(\.widgetFamily) var family
    let entry: LiftWaveEntry

    var body: some View {
        switch family {
        case .accessoryCircular:
            LiftWaveComplicationCircular(entry: entry)
        case .accessoryRectangular:
            LiftWaveComplicationRectangular(entry: entry)
        case .accessoryCorner:
            LiftWaveComplicationCorner(entry: entry)
        case .accessoryInline:
            Text(entry.workoutActive
                 ? "\(String(localized: "watch_training")) \(formatTime(entry.elapsedSeconds))"
                 : "LiftWave")
        default:
            Text("LiftWave")
        }
    }

    private func formatTime(_ seconds: Int) -> String {
        let m = seconds / 60
        let s = seconds % 60
        return String(format: "%d:%02d", m, s)
    }
}
