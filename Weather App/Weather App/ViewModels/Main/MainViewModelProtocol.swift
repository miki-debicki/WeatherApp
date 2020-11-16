//
//  MainViewModelProtocol.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import Foundation

protocol MainViewModelProtocol {
    var restAPIService: RestAPIServiceProtocol { get set }
}
