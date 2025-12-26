//
//  TestView.swift
//  Hand Tremor Demo
//
//  Created by Apple on 17/12/25.
//

import SwiftUI

struct TestView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var motion = MotionManager()

    @State private var countdown = 10
    @State private var score: Double?
    @State private var finished = false

    var body: some View {
        VStack(spacing: 32) {
            if finished, let score {
                ResultView(score: score) {
                    dismiss()
                }
            } else {
                Text("Hold your phone still")
                    .font(.title2)

                Text("\(countdown)")
                    .font(.system(size: 64, weight: .bold))

            }
        }
        .onAppear {
            start()
        }
    }

    private func start() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            countdown -= 1
            if countdown == 0 {
                timer.invalidate()
            }
        }

        motion.start(duration: 10) { result in
            score = result
            finished = true
        }
    }
}
