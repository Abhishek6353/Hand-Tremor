//
//  ContentView.swift
//  Hand Tremor Demo
//
//  Created by Apple on 17/12/25.
//

import SwiftUI

struct ContentView: View {
    @State private var startTest = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Hand Tremor Self-Test")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Hold your phone still for 10 seconds to check hand stability.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)

            Button("Start Test") {
                startTest = true
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .fullScreenCover(isPresented: $startTest) {
            TestView()
        }
    }
}
