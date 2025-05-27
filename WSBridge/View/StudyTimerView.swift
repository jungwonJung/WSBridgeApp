import SwiftUI

struct StudyTimerView: View {
    @State private var timeRemaining = 40 * 60
    @State private var isRunning = false
    @State private var timer: Timer? = nil

    var body: some View {
        VStack {
            Spacer()

            Text(timeString(from: timeRemaining))
                .font(.system(size: 96, weight: .bold, design: .monospaced))
                .foregroundColor(Color(hex: "#CE0F69"))

            Button(action: {
                isRunning.toggle()
                if isRunning {
                    startTimer()
                } else {
                    stopTimer()
                }
            }) {
                Text(isRunning ? "Pause" : "Start")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 12)
                    .background(Color(hex: "#CE0F69"))
                    .cornerRadius(10)
            }
            .padding(.top, 30)

            Spacer()

            Text("Try studying with the Pomodoro technique\n40 minutes of focus, 20 minutes of break\nProtect your concentration")
                .font(.body)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .onDisappear {
            stopTimer()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
