//
//  WeatherViewModel.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 12/11/20.
//

import Foundation

class WeatherViewModel {
    
    // MARK:  Constructor Properties
    private let weather: WeatherModel
    
    // MARK:  Life Cycle Methods
    init(weather: WeatherModel) {
        self.weather = weather
    }
    
    // MARK:  Format Methods
    public func formatForecastHeaderText() -> String {
        let rawCityName = weather.name
        let formatttedString = "FORECAST FOR \(rawCityName.uppercased())"
        
        return formatttedString
    }
    
    public func formatForecastText() -> String {
        let rawCityName = weather.name
        let formattedString = rawCityName
        
        return formattedString
    }
    
    public func formatWeatherDescriptionText() -> String {
        guard let rawDescription = weather.weather.first?.weatherDescription else {
            return "No Data Available"
        }
        
        let formatttedString = rawDescription.uppercased()
        return formatttedString
    }
    
    public func formatTemperatureText() -> String {
        let rawTemperature = weather.main.temp
        let formattedString = "\(String(format: "%.1f", rawTemperature))°"
        
        return formattedString
    }
    
    public func formatLowTemperatureTextToOneDecimalPlace() -> String {
        let rawLowTemperature = weather.main.tempMin
        let formattedString = "\(String(format: "%.1f", rawLowTemperature))°"
        
        return formattedString
    }
    
    public func formatHighTemperatureTextToOneDecimalPlace() -> String {
        let rawHighTemperature = weather.main.tempMax
        let formattedString = "\(String(format: "%.1f", rawHighTemperature))°"
        
        return formattedString
    }
    
    public func formatWindText() -> String {
        let rawWindSpeed = weather.wind.speed
        let formattedString = "\(rawWindSpeed)km/h"
        
        return formattedString
    }
    
    public func formatHumidityText() -> String {
        let rawHumidityText = weather.main.humidity
        let formattedString = "\(rawHumidityText)%"
        
        return formattedString
    }
    
    public func formatCloudsText() -> String {
        let rawCloudsString = weather.clouds.all
        let formattedString = "\(rawCloudsString)%"
        
        return formattedString
    }
    
    public func formatSunriseText() -> String {
        
        //This will be extracted
        
        let rawSunriseText = weather.sys.sunrise
        let formattedString = "\(rawSunriseText)"
        
        return formattedString
    }
    
    public func formatSunsetText() -> String {
        let rawSunsetText = weather.sys.sunset
        let formattedString = "\(rawSunsetText)"
        
        return formattedString
    }
}
