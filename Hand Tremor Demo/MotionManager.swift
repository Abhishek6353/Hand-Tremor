//
//  MotionManager.swift
//  Hand Tremor Demo
//
//  Created by Apple on 17/12/25.
//

import Foundation
import CoreMotion

final class MotionManager: ObservableObject {

    private let motionManager = CMMotionManager()
    private let queue = OperationQueue()

    private var samples: [Double] = []

    func start(duration: TimeInterval, completion: @escaping (Double) -> Void) {
        samples.removeAll()

        guard motionManager.isDeviceMotionAvailable else {
            completion(0)
            return
        }

        motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
        motionManager.startDeviceMotionUpdates(to: queue) { [weak self] motion, _ in
            guard let motion else { return }

            let acc = motion.userAcceleration
            let rot = motion.rotationRate

            let accMag = sqrt(acc.x * acc.x + acc.y * acc.y + acc.z * acc.z)
            let rotMag = sqrt(rot.x * rot.x + rot.y * rot.y + rot.z * rot.z)

            let combined = accMag + rotMag
            self?.samples.append(combined)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.motionManager.stopDeviceMotionUpdates()
            let score = self.calculateScore()
            completion(score)
        }
    }

    private func calculateScore() -> Double {
        guard !samples.isEmpty else { return 0 }

        let avgMovement = samples.reduce(0, +) / Double(samples.count)

        // Simple normalization (demo)
        let normalized = max(0, min(1, 1 - avgMovement * 5))
        return normalized * 100
    }
}
