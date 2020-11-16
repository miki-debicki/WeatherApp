//
//  UIViewExtension.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

extension UIView {
    func anchor (top: NSLayoutYAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil,  paddingTop: CGFloat? = nil, paddingBottom: CGFloat? = nil, paddingLeft: CGFloat? = nil, paddingRight: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop ?? 0).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft ?? 0).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -(paddingRight ?? 0)).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -(paddingBottom ?? 0)).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
