//
//  WeatherStackView.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

class WeatherStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .equalSpacing
        axis = .horizontal
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
