//
//  MainViewModel.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import Foundation

class MainViewModel: MainViewModelProtocol {
    var restAPIService: RestAPIServiceProtocol
    
    var delegate: MainViewModelDelegate!
    typealias Delegate = MainViewModelDelegate

    var weatherData: Observable<WeatherData?>
    
    init() {
        self.weatherData = Observable(nil)
        self.restAPIService = RestAPIService.sharedInstance
        self.getWeather()
    }
    
    private func getWeather() {
        restAPIService.getWeather() {weatherData, error in
            if error != nil {
                return
            }
            self.weatherData.value = weatherData!
            print(self.weatherData.value!)
        }
    }
}
