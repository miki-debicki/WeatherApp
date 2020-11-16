//
//  CityTableViewCell.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    public static var identifier = "CityTableViewCell"
    
    private let container = WeatherContainer()
    private let timeLabel = WeatherLabel(color: .darkGrey, font: .bold, size: 25)
    private let dateLabel = WeatherLabel(color: .lightGrey, font: .regular, size: 15)
    private let tempLabel = WeatherLabel(color: .darkGrey, font: .bold, size: 15)
    private let pressureLabel = WeatherLabel(color: .darkGrey, font: .bold, size: 15)
    private let humLabel = WeatherLabel(color: .darkGrey, font: .bold, size: 15)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none

        addSubview(container)
        container.addSubview(timeLabel)
        container.addSubview(dateLabel)
        
        container.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, paddingBottom: 5, paddingLeft: 10, paddingRight: 10)
        timeLabel.anchor(top: container.topAnchor, bottom: container.centerYAnchor, left: container.leftAnchor, right: container.centerXAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        dateLabel.anchor(top: container.centerYAnchor, bottom: container.bottomAnchor, left: timeLabel.leftAnchor, right: timeLabel.rightAnchor, paddingBottom: 20)
        
        let weatherStatsStackView = WeatherStackView(arrangedSubviews: [tempLabel, pressureLabel, humLabel])
        container.addSubview(weatherStatsStackView)
        weatherStatsStackView.anchor(top: container.topAnchor, bottom: container.bottomAnchor, left: container.centerXAnchor, right: container.rightAnchor, paddingTop: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(cityList: CityList?) {
        self.timeLabel.text = String(cityList?.dtTxt ?? "")[10..<16]
        self.dateLabel.text = String(cityList?.dtTxt ?? "")[0..<10]
        self.tempLabel.text = String("\(cityList?.main?.temp ?? 0)\n °C")
        self.pressureLabel.text = String("\(cityList?.main?.pressure ?? 0)\n hPa")
        self.humLabel.text = String("\(cityList?.main?.humidity ?? 0)\n %")
    }
}
