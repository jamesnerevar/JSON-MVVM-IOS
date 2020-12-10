//
//  MockWeatherNetworkManager.swift
//  JSON-MVVM-IOSTests
//
//  Created by James Jasenia on 1/12/20.
//

import Foundation
@testable import JSON_MVVM_IOS

class MockWeatherNetworkManager: WeatherNetworkManagerProtocol {
    
    func getWeatherData(for cityName: String, completion: @escaping (Result<WeatherModel, NetworkError>) -> Void) {
        
        guard cityName != "" else {
            completion(.failure(.invalidURL))
            return
        }
        
        //The Bundle(for:) lets the IDE knows where to find the URL (It exists in our Testing Bundle)
        guard let url = Bundle(for: MockWeatherNetworkManager.self).url(forResource: "get-success-response", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            return completion(.failure(.invalidURL))
        }
        
        guard let weather = try? JSONDecoder().decode(WeatherModel.self, from: data) else {
            return completion(.failure(.unableToCompleteNetworkRequest))
        }

        completion(.success(weather))
    }
}
