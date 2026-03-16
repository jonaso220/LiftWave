import SwiftUI
import WatchKit

// MARK: - App Colors (matching iPhone app_theme.dart)

enum LWColors {
    static let primary      = Color(red: 108/255, green: 99/255, blue: 255/255)   // #6C63FF
    static let primaryDark  = Color(red: 74/255, green: 66/255, blue: 214/255)    // #4A42D6
    static let primaryLight = Color(red: 156/255, green: 148/255, blue: 255/255)  // #9C94FF
    static let accent       = Color(red: 0/255, green: 212/255, blue: 170/255)    // #00D4AA
    static let accentOrange = Color(red: 255/255, green: 107/255, blue: 53/255)   // #FF6B35
    static let accentYellow = Color(red: 255/255, green: 209/255, blue: 102/255)  // #FFD166
    static let bgDark       = Color(red: 15/255, green: 15/255, blue: 26/255)     // #0F0F1A
    static let bgCard       = Color(red: 26/255, green: 26/255, blue: 46/255)     // #1A1A2E
    static let textMuted    = Color(red: 107/255, green: 107/255, blue: 138/255)  // #6B6B8A
    static let success      = Color(red: 0/255, green: 212/255, blue: 170/255)    // #00D4AA
    static let error        = Color(red: 255/255, green: 107/255, blue: 107/255)  // #FF6B6B

    // Muscle group colors (matching iPhone)
    static let chest    = Color(red: 255/255, green: 107/255, blue: 53/255)
    static let back     = Color(red: 108/255, green: 99/255, blue: 255/255)
    static let legs     = Color(red: 0/255, green: 212/255, blue: 170/255)
    static let shoulders = Color(red: 255/255, green: 209/255, blue: 102/255)
    static let arms     = Color(red: 255/255, green: 107/255, blue: 107/255)
    static let core     = Color(red: 78/255, green: 205/255, blue: 196/255)

    static let primaryGradient = LinearGradient(
        colors: [primary, primaryDark],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
    static let accentGradient = LinearGradient(
        colors: [accent, Color(red: 0, green: 180/255, blue: 140/255)],
        startPoint: .topLeading, endPoint: .bottomTrailing
    )
}

// MARK: - Root View

struct ContentView: View {
    @ObservedObject var state = WatchState.shared
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .transition(.opacity)
            } else {
                TabView {
                    RestTimerView()
                    WorkoutSummaryView()
                }
                .tabViewStyle(.verticalPage)
                .transition(.opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                withAnimation(.easeOut(duration: 0.5)) {
                    showSplash = false
                }
            }
        }
    }
}

// MARK: - Splash View

struct SplashView: View {
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {
            LWColors.bgDark.ignoresSafeArea()

            VStack(spacing: 12) {
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(LWColors.primaryGradient)
                    .scaleEffect(scale)

                Text("LiftWave")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundStyle(LWColors.primaryGradient)
                    .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                scale = 1.0
            }
            withAnimation(.easeIn(duration: 0.4).delay(0.3)) {
                opacity = 1.0
            }
        }
    }
}

// MARK: - Rest Timer View

struct RestTimerView: View {
    @ObservedObject var state = WatchState.shared
    @State private var crownValue: Double = 60
    @State private var showCompletedAnimation = false
    @State private var pulseScale: CGFloat = 1.0
    @FocusState private var crownFocused: Bool

    private let presets = [30, 60, 90, 120, 180]

    private var progress: Double {
        guard state.timerTotal > 0 else { return 0 }
        return Double(state.timerTotal - state.timerRemaining) / Double(state.timerTotal)
    }

    private var timeString: String {
        let m = state.timerRemaining / 60
        let s = state.timerRemaining % 60
        return String(format: "%d:%02d", m, s)
    }

    private var ringColor: Color {
        if showCompletedAnimation { return LWColors.success }
        if state.timerRunning && state.timerRemaining <= 3 { return LWColors.error }
        if state.timerRunning { return LWColors.accent }
        return LWColors.primary
    }

    var body: some View {
        VStack(spacing: 4) {
            // Title
            Text(String(localized: "watch_rest"))
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(LWColors.textMuted)

            // Circular timer with Digital Crown
            ZStack {
                // Background ring
                Circle()
                    .stroke(LWColors.bgCard, lineWidth: 8)

                // Progress ring
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        ringColor,
                        style: StrokeStyle(lineWidth: 8, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.linear(duration: 0.3), value: progress)

                // Completed flash overlay
                if showCompletedAnimation {
                    Circle()
                        .fill(LWColors.success.opacity(0.15))
                        .scaleEffect(pulseScale)
                        .animation(
                            .easeInOut(duration: 0.6).repeatCount(3, autoreverses: true),
                            value: pulseScale
                        )
                }

                // Time display
                VStack(spacing: 2) {
                    Text(timeString)
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundColor(
                            showCompletedAnimation ? LWColors.success :
                            (state.timerRunning && state.timerRemaining <= 3) ? LWColors.error : .white
                        )
                        .monospacedDigit()
                        .scaleEffect(showCompletedAnimation ? 1.1 : 1.0)
                        .animation(.spring(response: 0.3), value: showCompletedAnimation)

                    Text(statusLabel)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(
                            showCompletedAnimation ? LWColors.success : LWColors.textMuted
                        )
                }
            }
            .frame(width: 115, height: 115)
            .focusable(true)
            .focused($crownFocused)
            .digitalCrownRotation(
                $crownValue,
                from: 10, through: 600, by: 5,
                sensitivity: .medium,
                isContinuous: false,
                isHapticFeedbackEnabled: true
            )
            .onChange(of: crownValue) { newValue in
                if !state.timerRunning {
                    let rounded = Int(newValue / 5) * 5
                    state.resetTimer(duration: max(10, rounded))
                }
            }
            .onAppear { crownFocused = true }

            // Control buttons
            HStack(spacing: 12) {
                // Reset
                Button {
                    state.resetTimer(duration: state.timerTotal)
                    crownValue = Double(state.timerTotal)
                    showCompletedAnimation = false
                    WKInterfaceDevice.current().play(.click)
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(LWColors.textMuted)
                        .frame(width: 36, height: 36)
                        .background(LWColors.bgCard)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)

                // Play / Pause
                Button {
                    toggleTimer()
                } label: {
                    Image(systemName: state.timerRunning ? "pause.fill" : "play.fill")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(
                            state.timerRunning ? LWColors.accentOrange : LWColors.accent
                        )
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)

                // Skip (+30s)
                Button {
                    if !state.timerRunning {
                        let newDuration = min(state.timerTotal + 30, 600)
                        state.resetTimer(duration: newDuration)
                        crownValue = Double(newDuration)
                    }
                    WKInterfaceDevice.current().play(.click)
                } label: {
                    Text("+30")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundColor(LWColors.textMuted)
                        .frame(width: 36, height: 36)
                        .background(LWColors.bgCard)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
            }

            // Presets
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(presets, id: \.self) { seconds in
                        Button {
                            state.resetTimer(duration: seconds)
                            crownValue = Double(seconds)
                            showCompletedAnimation = false
                            WKInterfaceDevice.current().play(.click)
                        } label: {
                            Text(presetLabel(seconds))
                                .font(.system(size: 11, weight: .bold, design: .rounded))
                                .foregroundColor(
                                    state.timerTotal == seconds ? .white : LWColors.primary
                                )
                                .padding(.horizontal, 9)
                                .padding(.vertical, 4)
                                .background(
                                    state.timerTotal == seconds
                                        ? LWColors.primary
                                        : LWColors.primary.opacity(0.15)
                                )
                                .clipShape(Capsule())
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .onChange(of: state.timerRemaining) { newValue in
            handleTimerTick(newValue)
        }
    }

    private var statusLabel: String {
        if showCompletedAnimation { return String(localized: "watch_done") }
        if state.timerRunning { return String(localized: "watch_running") }
        return String(localized: "watch_paused")
    }

    private func handleTimerTick(_ remaining: Int) {
        guard state.timerRunning else { return }

        // Last 3 seconds: prominent haptic each second
        if remaining > 0 && remaining <= 3 {
            WKInterfaceDevice.current().play(.directionUp)
        }

        // Timer completed
        if remaining == 0 {
            // Strong completion haptics sequence
            WKInterfaceDevice.current().play(.notification)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                WKInterfaceDevice.current().play(.success)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                WKInterfaceDevice.current().play(.notification)
            }

            // Trigger completed animation
            withAnimation {
                showCompletedAnimation = true
                pulseScale = 1.15
            }

            // Reset animation after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    showCompletedAnimation = false
                    pulseScale = 1.0
                }
            }
        }
    }

    private func toggleTimer() {
        if state.timerRunning {
            state.stopTimer()
            WKInterfaceDevice.current().play(.stop)
            WatchConnectivityService.shared.sendToPhone([
                "type": "stopTimer"
            ])
        } else {
            showCompletedAnimation = false
            let duration = state.timerRemaining > 0 ? state.timerRemaining : state.timerTotal
            state.startTimer(duration: duration)
            WKInterfaceDevice.current().play(.start)
            WatchConnectivityService.shared.sendToPhone([
                "type": "startTimer",
                "timerDuration": duration
            ])
        }
    }

    private func presetLabel(_ seconds: Int) -> String {
        if seconds < 60 { return "\(seconds)s" }
        let m = seconds / 60
        let s = seconds % 60
        return s > 0 ? "\(m):\(String(format: "%02d", s))" : "\(m)m"
    }
}

// MARK: - Workout Summary View

struct WorkoutSummaryView: View {
    @ObservedObject var state = WatchState.shared

    private var elapsedString: String {
        let m = state.elapsedSeconds / 60
        let s = state.elapsedSeconds % 60
        return String(format: "%d:%02d", m, s)
    }

    var body: some View {
        if state.workoutActive {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    // Header
                    HStack {
                        Image(systemName: "figure.strengthtraining.traditional")
                            .foregroundStyle(LWColors.primaryGradient)
                        Text(state.workoutName.isEmpty ? String(localized: "watch_workout") : state.workoutName)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    }

                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.system(size: 11))
                            .foregroundColor(LWColors.accent)
                        Text(elapsedString)
                            .font(.system(size: 12, weight: .semibold, design: .rounded))
                            .foregroundColor(LWColors.accent)
                            .monospacedDigit()
                    }

                    Divider()
                        .background(LWColors.bgCard)

                    // Exercise list
                    if state.exercises.isEmpty {
                        Text(String(localized: "watch_noExercises"))
                            .font(.system(size: 12))
                            .foregroundColor(LWColors.textMuted)
                    } else {
                        ForEach(state.exercises) { exercise in
                            HStack {
                                Circle()
                                    .fill(colorForMuscle(exercise.muscleGroup))
                                    .frame(width: 8, height: 8)
                                VStack(alignment: .leading, spacing: 1) {
                                    Text(exercise.name)
                                        .font(.system(size: 12, weight: .semibold))
                                        .foregroundColor(.white)
                                        .lineLimit(1)
                                    Text("\(exercise.completedSets)/\(exercise.totalSets) \(String(localized: "watch_sets"))")
                                        .font(.system(size: 10))
                                        .foregroundColor(LWColors.textMuted)
                                }
                                Spacer()
                                if exercise.completedSets >= exercise.totalSets && exercise.totalSets > 0 {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(LWColors.success)
                                        .font(.system(size: 14))
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
        } else {
            VStack(spacing: 12) {
                Image(systemName: "figure.strengthtraining.traditional")
                    .font(.system(size: 28))
                    .foregroundStyle(LWColors.primaryGradient)
                Text(String(localized: "watch_noWorkout"))
                    .font(.system(size: 13))
                    .foregroundColor(LWColors.textMuted)
                    .multilineTextAlignment(.center)
                Text(String(localized: "watch_startOnIphone"))
                    .font(.system(size: 11))
                    .foregroundColor(LWColors.primary.opacity(0.6))
            }
        }
    }

    private func colorForMuscle(_ muscle: String) -> Color {
        switch muscle {
        case "Pecho": return LWColors.chest
        case "Espalda": return LWColors.back
        case "Piernas": return LWColors.legs
        case "Hombros": return LWColors.shoulders
        case "Brazos": return LWColors.arms
        case "Core": return LWColors.core
        default: return LWColors.primary
        }
    }
}
