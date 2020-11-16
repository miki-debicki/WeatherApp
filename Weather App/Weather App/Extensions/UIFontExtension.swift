//
//  UIFontExtension.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

extension UIFont {
    static func arialFont(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        var fontName: String
        
        switch weight {
        case .regular:
            fontName = "ArialMT"
        case .bold:
            fontName = "Arial-BoldMT"
        default:
            fontName = "ArialMT"
        }
        
        return UIFont(name: fontName, size: size)!
    }
    
    static func regularArialFont(ofSize size: CGFloat) -> UIFont {
        return arialFont(ofSize: size, weight: .regular)
    }
    
    static func boldArialFont(ofSize size: CGFloat) -> UIFont {
        return arialFont(ofSize: size, weight: .bold)
    }
}
