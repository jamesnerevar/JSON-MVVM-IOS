//
//  WeatherNetworkManagerFactory.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 1/12/20.
//

import Foundation

class WeatherNetworkManagerFactory {
    
    static func create()  -> WeatherNetworkManagerProtocol {
        
        let environment = ProcessInfo.processInfo.environment["ENVIRONMENT"]
        
        if environment == "TEST" {
            return MockWeatherNetworkManager()
        } else {
            return WeatherNetworkManager()
        }
    }
    
}
