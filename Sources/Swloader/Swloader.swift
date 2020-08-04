//
//  Swloader.swift
//
//
//  Created by Victor Lourme on 03/08/2020.
//

// Dependencies
import SwiftUI

///
/// AnimationView displays a rotating circle
///
@available(iOS 13.0, *)
public struct AnimationView: View {
    @State private var animate: Bool = false
    
    public var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.80)
                .stroke(Color.gray, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                .frame(width: 112, height: 112)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear {
            self.animate = true
        }
    }
}

///
/// Loader modifier
/// - parameters:
///     - label: Displays a text/legend
///     - icon: Displays a icon instead of a circle effect
///
@available(iOS 13.0, *)
public struct Loader: ViewModifier {
    @Binding public var isPresented: Bool
    @State public var label: String = ""
    @State public var icon: String = ""
    
    var loader: some View {
        ZStack {
            Blur()
                .cornerRadius(10)
            
            VStack {
                if icon.isEmpty {
                    AnimationView()
                } else {
                    Image(systemName: icon)
                        .font(.system(size: 92))
                        .frame(width: 112, height: 112)
                        .foregroundColor(.gray)
                }
                
                if !label.isEmpty {
                    Text(label)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                }
            }
        }
        .frame(minWidth: 200, idealWidth: 220, maxWidth: 250, minHeight: 200, idealHeight: 220, maxHeight: 250)
        .scaleEffect(isPresented ? 1 : 0)
        .animation(.easeInOut)
        .transition(.scale)
        .zIndex(1)
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            loader
            
            content
        }
    }
}

///
/// View extension
///
@available(iOS 13.0, *)
public extension View {
    ///
    /// Show a loader on top of the view
    /// - parameters:
    ///     - isPresented: If true, it will display the loader
    ///     - label: Optional, this displays a legend
    ///     - icon: Optional, this displays an icon instead of a loader animation
    ///
    func showLoader(isPresented: Binding<Bool>,
                    label: String = "",
                    icon: String = "") -> some View {
        return self.modifier(Loader(isPresented: isPresented, label: label, icon: icon))
    }
}
