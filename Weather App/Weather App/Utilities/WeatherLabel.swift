//
//  WeatherLabel.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

class WeatherLabel: UILabel {
    convenience init(color: FontColor, font: Font, size: Int) {
        self.init()
        
        textAlignment = .center
        numberOfLines = 0
        sizeToFit()
        
        switch color {
        case .darkGrey:
            textColor = Colors.darkGrey
        case .lightGrey:
            textColor = Colors.lightGrey
        }
        
        switch font {
        case .regular:
            self.font = UIFont.arialFont(ofSize: CGFloat(size))
        case .bold:
            self.font = UIFont.boldArialFont(ofSize: CGFloat(size))
        }
    }
}

enum FontColor {
    case lightGrey
    case darkGrey
}

enum Font {
    case regular
    case bold
}
