//
//  ResultView.swift
//  Hand Tremor Demo
//
//  Created by Apple on 17/12/25.
//

import SwiftUI

struct ResultView: View {
    let score: Double
    let onDone: () -> Void

    var rating: String {
        switch score {
        case 85...100: return "Very Stable"
        case 65..<85: return "Stable"
        case 40..<65: return "Slight Tremor"
        default: return "Unstable"
        }
    }

    var body: some View {
        VStack(spacing: 24) {
            Text("Stability Score")
                .font(.headline)

            Text("\(Int(score))%")
                .font(.system(size: 64, weight: .bold))

            Text(rating)
                .font(.title2)

            Button("Done", action: onDone)
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

