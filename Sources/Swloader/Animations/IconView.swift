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
    
    public var body: some View {
        Image(systemName: icon)
            .font(.system(size: 92))
            .frame(width: 112, height: 112)
            .foregroundColor(.gray)
    }
}
