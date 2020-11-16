//
//  WeatherData.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import Foundation

struct WeatherData: Codable {
    let list: [WeatherList]?
}

struct WeatherList: Codable {
    let id: Int?
    let name: String?
    let main: WeatherValue?
}

struct CityData: Codable {
    let list: [CityList]?
    let city: City?
}

struct CityList: Codable {
    let main: WeatherValue?
    let dtTxt: String?
}

struct City: Codable {
    let id: Int?
    let name: String?
}

struct WeatherValue: Codable {
    let temp: Double?
    let pressure: Int?
    let humidity: Int?
}
