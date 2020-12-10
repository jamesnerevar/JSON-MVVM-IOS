//
//  WeatherNetworkManagerProtocol.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 1/12/20.
//

import Foundation

protocol WeatherNetworkManagerProtocol {
    
    func getWeatherData(for cityName: String, completion: @escaping (Result<WeatherModel, NetworkError>) -> Void)
    
}
