//
//  MainCollectionViewCell.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    public static var identifier = "MainCollectionViewCell"
    
    private let container = WeatherContainer()
    private let cityLabel = WeatherLabel(color: .darkGrey, font: .bold, size: 20)
    private let tempLabel = WeatherLabel(color: .lightGrey, font: .bold, size: 15)
    private let pressureLabel = WeatherLabel(color: .lightGrey, font: .bold, size: 15)
    private let humLabel = WeatherLabel(color: .lightGrey, font: .bold, size: 15)

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .clear

        addSubview(container)
        container.addSubview(cityLabel)
                
        container.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor)
        cityLabel.anchor(top: container.topAnchor, bottom: container.centerYAnchor, left: container.leftAnchor, right: container.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
        
        let weatherStatsStackView = WeatherStackView(arrangedSubviews: [tempLabel, pressureLabel, humLabel])
        container.addSubview(weatherStatsStackView)
        weatherStatsStackView.anchor(top: container.centerYAnchor, bottom: container.bottomAnchor, left: container.leftAnchor, right: container.rightAnchor, paddingBottom: 10, paddingLeft: 10, paddingRight: 10)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(weatherList: WeatherList?) {
        self.cityLabel.text = weatherList?.name
        self.tempLabel.text = String("\(weatherList?.main?.temp ?? 0)\n °C")
        self.pressureLabel.text = String("\(weatherList?.main?.pressure ?? 0)\n hPa")
        self.humLabel.text = String("\(weatherList?.main?.humidity ?? 0)\n %")
    }
}
