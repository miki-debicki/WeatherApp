//
//  RestAPIServiceProtocol.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import Foundation

protocol RestAPIServiceProtocol {
    typealias GetWeatherCallback = (WeatherData?, Error?) -> ()
    func getWeather(callback: GetWeatherCallback?)
    
    typealias GetPredictionCallback = (CityData?, Error?) -> ()
    func getPrediction(cityID: Int?, callback: GetPredictionCallback?)
}
