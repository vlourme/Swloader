//
//  Swloader.swift
//  Main file
//
//  Created by Victor Lourme on 03/08/2020.
//

// Dependencies
import SwiftUI

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
                    CircleView()
                } else {
                    IconView(icon: style.icon, animate: style.isSpinning)
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
