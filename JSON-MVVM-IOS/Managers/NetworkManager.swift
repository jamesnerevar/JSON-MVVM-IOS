//
//  NetworkManager.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import Foundation

class WeatherNetworkManager {
    
    static let shared = WeatherNetworkManager()
    static let
    private init() {}
    
    
    func getWeatherData(for city: String, completed: @escaping (Result<WeatherModel, NetworkError>) -> Void) {
        
        
        
    }
}
