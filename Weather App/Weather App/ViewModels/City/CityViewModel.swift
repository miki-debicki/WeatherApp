//
//  CityViewModel.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import Foundation

class CityViewModel: CityViewModelProtocol {
    var restAPIService: RestAPIServiceProtocol
    
    var delegate: CityViewModelDelegate!
    typealias Delegate = CityViewModelDelegate

    var cityData: Observable<CityData?>
    private var cityID: Int? {
        didSet {
            getPrediction()
        }
    }
    
    init() {
        self.cityData = Observable(nil)
        self.restAPIService = RestAPIService.sharedInstance
    }
    
    private func getPrediction() {
        restAPIService.getPrediction(cityID: self.cityID) { (cityData, error) in
            if error != nil {
                return
            }
            self.cityData.value = cityData!
            print(self.cityData.value!)
        }
    }
    
    func setID(cityID: Int?) {
        self.cityID = cityID
    }
}
