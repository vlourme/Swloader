//
//  CircleView.swift
//  Circle spinning
//
//  Created by Victor Lourme on 04/08/2020.
//

import SwiftUI

///
/// AnimationView displays a rotating circle
///
@available(iOS 13.0, *)
public struct CircleView: View {
    // Spinning speed
    @State public var duration: Double = 1
    
    // Animation
    @State private var animate: Bool = false
    
    public var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.80)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width: 112, height: 112)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.linear(duration: duration).repeatForever(autoreverses: false))
        }
        .onAppear {
            self.animate = true
        }
    }
}
