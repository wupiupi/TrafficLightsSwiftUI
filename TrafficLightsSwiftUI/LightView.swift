//
//  LightView.swift
//  TrafficLightsSwiftUI
//
//  Created by Paul Makey on 1.03.24.
//

import SwiftUI

struct LightView: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 125)
            .foregroundStyle(color)
            .opacity(opacity)
            .overlay(Circle().stroke(.white, lineWidth: 5))
            .shadow(radius: 10)
    }
}

#Preview {
    LightView(color: .red, opacity: 0.3)
}
