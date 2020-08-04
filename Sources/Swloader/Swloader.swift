//
//  Swloader.swift
//  Main file
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
///
@available(iOS 13.0, *)
public struct Loader: ViewModifier {
    // isPresented -> Displays animation when true
    @Binding public var isPresented: Bool
    
    // title -> Displays a title when filled
    @State public var style: LoaderStyle = .default()
    
    var loader: some View {
        ZStack {
            Blur()
                .cornerRadius(10)
            
            VStack {
                if style.icon.isEmpty {
                    AnimationView()
                } else {
                    Image(systemName: style.icon)
                        .font(.system(size: 92))
                        .frame(width: 112, height: 112)
                        .foregroundColor(.gray)
                }
                
                Group {
                    if !style.title.isEmpty {
                        Text(style.title)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding(.top)
                    }
                    
                    if !style.legend.isEmpty {
                        Text(style.legend)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .padding(.top, style.title.isEmpty ? 15 : 0)
                    }
                }.padding([.leading, .trailing])
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
    ///     - style: LoaderStyle, defaults to spinning circle
    ///
    func loader(isPresented: Binding<Bool>, style: LoaderStyle = .default()) -> some View {
        return self.modifier(Loader(isPresented: isPresented, style: style))
    }
}
