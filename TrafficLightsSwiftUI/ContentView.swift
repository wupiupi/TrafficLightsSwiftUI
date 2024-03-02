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
                lights.yellowLight = 1
                lights.redLight = 0.5
            case .yellow:
                currentLight = .green
                lights.greenLight = 1
                lights.yellowLight = 0.5
            case .green:
                currentLight = .red
                lights.redLight = 1
                lights.greenLight = 0.5
        }
    }
}

enum CurrentLight {
    case red, yellow, green
}

#Preview {
    ContentView()
}
