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
    ///
    case `default`(_ title: String = "", legend: String = "")
    
    ///
    /// This shows a static and non-animated icon
    /// - parameters:
    ///     - icon: Required, this shows the icon (SF Symbol)
    ///     - title: Optional, this displays a title
    ///     - legend: Optional, this displays a small legend
    ///
    case icon(_ icon: String, title: String = "", legend: String = "")
    
    // Get the title
    var title: String {
        get {
            switch(self) {
                case let .default(title, _),
                     let .icon(_, title, _):
                    return title
            }
        }
    }
    
    // Get the title
    var legend: String {
        get {
            switch(self) {
                case let .default(_, legend),
                     let .icon(_, _, legend):
                    return legend
            }
        }
    }
    
    // Get the icon
    var icon: String {
        get {
            switch(self) {
                case let .icon(icon, _, _):
                    return icon
                
                default:
                    return ""
            }
        }
    }
}
