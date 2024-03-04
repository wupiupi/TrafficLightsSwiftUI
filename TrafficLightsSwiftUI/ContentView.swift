//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Paul Makey on 1.03.24.
//

import SwiftUI

struct ContentView: View {
    @State private var currentLight = CurrentLight.green
    @State private var lights = (red: 0.5, yellow: 0.5, green: 0.5)
    @State private var buttonText = "Start"
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
            LightView(color: .red, opacity: lights.red)
            LightView(color: .yellow, opacity: lights.yellow)
            LightView(color: .green, opacity: lights.green)
            
            Spacer()
            
            Button(action: buttonDidTapped) {
                Text(buttonText)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                    .padding(
                        EdgeInsets(
                            top: 8,
                            leading: 50,
                            bottom: 8,
                            trailing: 50
                        )
                    )
                
                    .overlay(Capsule().stroke(.white, lineWidth: 5))
                    .background(Color.blue.clipShape(Capsule()))
            }
            .shadow(radius: 10)
        }
        .padding()
    }
    
    private func buttonDidTapped() {
        if buttonText == "Start" {
            buttonText = "Next"
        }
        
        switch currentLight {
            case .red:
                currentLight = .yellow
                lights.yellow = lightIsOn
                lights.red = lightIsOff
            case .yellow:
                currentLight = .green
                lights.green = lightIsOn
                lights.yellow = lightIsOff
            case .green:
                currentLight = .red
                lights.red = lightIsOn
                lights.green = lightIsOff
        }
    }
}

enum CurrentLight {
    case red, yellow, green
}

#Preview {
    ContentView()
}
