//
//  NetworkManager.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import Foundation

class WeatherNetworkManager: WeatherNetworkManagerProtocol {
    
    //Add your own API_KEY
    private let API_KEY: String = ""
    
    func getWeatherData(for cityName: String, completion: @escaping (Result<WeatherModel, NetworkError>) -> Void) {
        
        guard cityName != "" else {
            completion(.failure(.invalidURL))
            return
        }
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&units=metric&appid=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.unableToCompleteNetworkRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(.invalidResponseCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(.corruptedData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherModel.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(.corruptedData))
            }
        }.resume()
    }
}
