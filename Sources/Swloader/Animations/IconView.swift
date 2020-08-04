//
//  IconView.swift
//  Swloader
//
//  Created by Victor Lourme on 04/08/2020.
//

import SwiftUI

///
/// IconView displays an static icon
///
@available(iOS 13.0, *)
public struct IconView: View {
    @State public var icon: String
    @State public var animate: Bool = false
    @State private var spin: Bool = false
    
    public var body: some View {
        Image(systemName: icon)
            .font(.system(size: 92))
            .frame(width: 112, height: 112)
            .foregroundColor(.gray)
            .rotationEffect(Angle(degrees: spin ? 360 : 0))
            .animation(Animation.linear(duration: 3.5).repeatForever(autoreverses: false))
            .onAppear {
                if self.animate {
                    self.spin.toggle()
                }
            }
    }
}
