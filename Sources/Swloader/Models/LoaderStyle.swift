//
//  LoaderStyle.swift
//  Types of loaders
//
//  Created by Victor Lourme on 04/08/2020.
//

import Foundation

///
/// Types of loaders
///
public enum LoaderStyle {
    ///
    /// This shows the default spinning circle
    /// - parameters:
    ///     - title: Optional, this displays a title
    ///     - legend: Optional, this displays a small legend
    ///     - duration: Optional, change the rotation speed
    ///
    case `default`(_ title: String = "", legend: String = "", duration: Double = 1)
    
    ///
    /// This shows a static and non-animated icon
    /// - parameters:
    ///     - icon: Required, this shows the icon (SF Symbol)
    ///     - title: Optional, this displays a title
    ///     - legend: Optional, this displays a small legend
    ///     - spinning: Optional, this makes the icon spin
    ///     - speed: Optional, change the rotation speed
    ///
    case icon(_ icon: String, title: String = "", legend: String = "", spinning: Bool = false, speed: Double = 1)
    
    // Get the title
    var title: String {
        get {
            switch(self) {
                case let .default(title, _, _),
                     let .icon(_, title, _, _, _):
                    return title
            }
        }
    }
    
    // Get the title
    var legend: String {
        get {
            switch(self) {
                case let .default(_, legend, _),
                     let .icon(_, _, legend, _, _):
                    return legend
            }
        }
    }
    
    // Get spinning speed
    var speed: Double {
        get {
            switch(self) {
                case let .default(_, _, speed),
                     let .icon(_, _, _, _, speed):
                    return speed
            }
        }
    }
    
    // Get the icon
    var icon: String {
        get {
            switch(self) {
                case let .icon(icon, _, _, _, _):
                    return icon
                
                default:
                    return ""
            }
        }
    }
    
    // Is spinning
    var isSpinning: Bool {
        get {
            switch(self) {
                case let .icon(_, _, _, spinning, _):
                    return spinning
                
                default:
                    return false
            }
        }
    }
}
