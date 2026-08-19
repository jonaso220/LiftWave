import Combine
import Foundation
import SwiftUI

/// Observable model that holds the current workout and timer state received from the iPhone.
class WatchState: ObservableObject {
    static let shared = WatchState()

    // ── Timer ───────────────────────────────────────────────────────────
    @Published var timerRunning = false
    @Published var timerRemaining: Int = 60
    @Published var timerTotal: Int = 60

    // ── Workout ─────────────────────────────────────────────────────────
    @Published var workoutActive = false
    @Published var workoutName: String = ""
    @Published var elapsedSeconds: Int = 0
    @Published var exercises: [WatchExercise] = []

    // ── Local timer ─────────────────────────────────────────────────────
    private var timer: Timer?

    func startTimer(duration: Int, total: Int? = nil) {
        timerTotal = total ?? duration
        timerRemaining = duration
        timerRunning = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }
            if self.timerRemaining > 0 {
                self.timerRemaining -= 1
                if self.timerRemaining == 0 {
                    self.stopTimer()
                }
            } else {
                self.stopTimer()
            }
        }
    }

    func stopTimer() {
        timerRunning = false
        timer?.invalidate()
        timer = nil
    }

    func resetTimer(duration: Int) {
        stopTimer()
        timerTotal = duration
        timerRemaining = duration
    }

    func updateFromContext(_ data: [String: Any]) {
        DispatchQueue.main.async {
            if let active = data["workoutActive"] as? Bool {
                self.workoutActive = active
            }
            if let name = data["workoutName"] as? String {
                self.workoutName = name
            }
            if let elapsed = data["elapsedSeconds"] as? Int {
                self.elapsedSeconds = elapsed
            }
            if let running = data["timerRunning"] as? Bool {
                let remaining = data["timerRemaining"] as? Int ?? self.timerRemaining
                let total = data["timerTotal"] as? Int ?? self.timerTotal
                if running {
                    self.startTimer(duration: remaining, total: total)
                } else {
                    self.stopTimer()
                    self.timerTotal = total
                    self.timerRemaining = remaining
                }
            }
            if let exerciseList = data["exercises"] as? [[String: Any]] {
                self.exercises = exerciseList.enumerated().map { index, dict in
                    WatchExercise(
                        id: dict["id"] as? String ?? "\(index)",
                        name: dict["name"] as? String ?? "",
                        muscleGroup: dict["muscleGroup"] as? String ?? "",
                        completedSets: dict["completedSets"] as? Int ?? 0,
                        totalSets: dict["totalSets"] as? Int ?? 0
                    )
                }
            }
        }
    }
}

struct WatchExercise: Identifiable, Equatable {
    let id: String
    let name: String
    let muscleGroup: String
    let completedSets: Int
    let totalSets: Int
}

