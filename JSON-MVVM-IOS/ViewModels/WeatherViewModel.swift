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
    
    public func formatWeatherDescriptionText() -> String {
        guard let rawDescription = weather.weather.first?.weatherDescription else { return "Description not available" }
        let formatttedString = rawDescription.capitalized
        
        return formatttedString
    }
    
    public func formatWeatherDescriptionTextUppercased() -> String {
        guard let rawDescription = weather.weather.first?.weatherDescription else { return "No Data Available" }
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
    
    public func formatLowTemperatureTextToOneDecimalPlaceWithHeading() -> String {
        let rawLowTemperature = weather.main.tempMin
        let formattedString = "Low: \(String(format: "%.1f", rawLowTemperature))°"
        
        return formattedString
    }
    
    public func formatHighTemperatureTextToOneDecimalPlace() -> String {
        let rawHighTemperature = weather.main.tempMax
        let formattedString = "\(String(format: "%.1f", rawHighTemperature))°"
        
        return formattedString
    }
    
    public func formatHighTemperatureTextToOneDecimalPlaceWithHeading() -> String {
        let rawLowTemperature = weather.main.tempMax
        let formattedString = "High: \(String(format: "%.1f", rawLowTemperature))°"
        
        return formattedString
    }
    
    public func formatWindText() -> String {
        let rawWindSpeed = weather.wind.speed
        let formattedString = "\(rawWindSpeed)km/h"
        
        return formattedString
    }
    
    public func formatWindTextWithHeading() -> String {
        let rawWindSpeed = weather.wind.speed
        let formattedString = "Winds: \(rawWindSpeed)km/h"
        
        return formattedString
    }
    
    public func formatHumidityText() -> String {
        let rawHumidityText = weather.main.humidity
        let formattedString = "\(rawHumidityText)%"
        
        return formattedString
    }
    
    public func formatHumidityTextWithHeading() -> String {
        let rawHumidityText = weather.main.humidity
        let formattedString = "Humidity: \(rawHumidityText)%"
        
        return formattedString
    }
    
    public func formatCloudsText() -> String {
        let rawCloudsString = weather.clouds.all
        let formattedString = "\(rawCloudsString)%"
        
        return formattedString
    }
    
    public func formatCloudsTextWithHeading() -> String {
        let rawCloudsString = weather.clouds.all
        let formattedString = "Clouds: \(rawCloudsString)%"
        
        return formattedString
    }
    
    public func formatDetailText() -> String {
        let formattedString = "\(formatWeatherDescriptionText()) today with winds of \(formatWindText()). The high will be \(formatHighTemperatureTextToOneDecimalPlace()) with a low of \(formatLowTemperatureTextToOneDecimalPlace())"
        
        return formattedString
    }
}
