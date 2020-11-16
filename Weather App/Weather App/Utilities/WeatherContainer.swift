//
//  WeatherContainer.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 16/11/2020.
//

import UIKit

class WeatherContainer: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
