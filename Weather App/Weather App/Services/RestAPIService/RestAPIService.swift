//
//  RestAPIService.swift
//  Weather App
//
//  Created by Mikołaj Dębicki on 15/11/2020.
//

import Foundation

class RestAPIService: RestAPIServiceProtocol {
    static let sharedInstance = RestAPIService()
    private let APIKey = "dbbe5b69f8a0ad407b12ff81ac410031"
    private let defaultCityID = 756135
}

// MARK: - PRIVATE METHODS
extension RestAPIService {
    private func makeRequest(url: URL,
                    method: Method,
                    completion: @escaping (_ result: Results) -> Void) {
        let request = self.prepareRequest(url: url, method: method)
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        let task = session.dataTask(with: request) { (data, response, error) in
            completion(Results(withData: data,
                               response: Response(withResponse: response),
                               error: error))
        }
        task.resume()
    }
    
    private func prepareRequest(url: URL, method: Method) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

// MARK: - PUBLIC METHODS
extension RestAPIService {
    func getWeather(callback: GetWeatherCallback?) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/find?lat=52.2297&lon=21.0122&cnt=20&units=metric&appid=\(APIKey)") else { return }
        self.makeRequest(url: url, method: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let parsedData = try? decoder.decode(WeatherData.self, from: data) else { print("Nope"); return }
                callback?(parsedData, nil)
            }
        }
    }
    
    func getPrediction(cityID: Int?, callback: GetPredictionCallback?) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?id=\(cityID ?? defaultCityID)&units=metric&appid=\(APIKey)") else { return }
        self.makeRequest(url: url, method: .get) { (results) in
            if let data = results.data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                guard let parsedData = try? decoder.decode(CityData.self, from: data) else { print("Nope"); return }
                callback?(parsedData, nil)
            }
        }
    }
}

// MARK: - HELPER MODELS
extension RestAPIService {
  struct Response {
        var response: URLResponse?
        var statusCode: Int = 0
        
        init(withResponse response: URLResponse?) {
            guard let response = response else { return }
            self.response = response
            self.statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
        }
    }

    struct Results {
        var data: Data?
        var response: Response?
        var error: Error?
        
        init(withData data: Data?, response: Response?, error: Error?) {
            self.data = data
            self.response = response
            self.error = error
        }
        
        init(withError error: Error) {
            self.error = error
        }
    }
    
    enum Method: String {
        case get
        case post
    }
}
