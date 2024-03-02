//
//  ContentView.swift
//  TrafficLightsSwiftUI
//
//  Created by Paul Makey on 1.03.24.
//

import SwiftUI

struct ContentView: View {
    @State var currentLight = CurrentLight.green
    @State var lights = (redLight: 0.5, yellowLight: 0.5, greenLight: 0.5)
    @State var buttonText = "Start"
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
            LightView(color: .red, opacity: lights.redLight)
            LightView(color: .yellow, opacity: lights.yellowLight)
            LightView(color: .green, opacity: lights.greenLight)
            
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
                lights.yellowLight = lightIsOn
                lights.redLight = lightIsOff
            case .yellow:
                currentLight = .green
                lights.greenLight = lightIsOn
                lights.yellowLight = lightIsOff
            case .green:
                currentLight = .red
                lights.redLight = lightIsOn
                lights.greenLight = lightIsOff
        }
    }
}

enum CurrentLight {
    case red, yellow, green
}

#Preview {
    ContentView()
}
