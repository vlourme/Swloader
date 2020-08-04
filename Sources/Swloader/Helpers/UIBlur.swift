//
//  UIBlur.swift
//  UIKit based blur effect for background
//
//  Created by Victor Lourme on 03/08/2020.
//

import SwiftUI

///
/// Blur based on UIKit method
/// It uses colorScheme to adapt to dark mode.
///
@available(iOS 13.0, *)
public struct Blur: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme
    
    var style: UIBlurEffect.Style {
        get {
            return colorScheme == .dark ? .dark : .light
        }
    }
    
    public func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
