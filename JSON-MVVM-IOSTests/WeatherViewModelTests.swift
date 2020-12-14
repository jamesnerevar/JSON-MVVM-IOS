//
//  WeatherViewModelTests.swift
//  JSON-MVVM-IOSTests
//
//  Created by James Jasenia on 1/12/20.
//

import XCTest
@testable import JSON_MVVM_IOS

class WeatherViewModelTests: XCTestCase {

    //OPEN WEATHER API Example
    let weatherDataMock = WeatherModel(
        coord: Coord(lon: 145.77, lat: -16.92),
        weather: [Weather(id: 82, main: "clouds", weatherDescription: "scattered clouds", icon: "03n")],
        base: "stations",
        main: Main(temp: 300.15, pressure: 1007, humidity: 74, tempMin: 200.15, tempMax: 300.15),
        visibility: 10000,
        wind: Wind(speed: 3.6, deg: 160),
        clouds: Clouds(all: 40),
        dt: 1485790200,
        sys: Sys(type: 1, id: 8166, message: 0.2064, country: "AU", sunrise: 1485720272, sunset: 1485766550),
        id: 2172797,
        name: "Cairns",
        cod: 200)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormatForecastHeaderText() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "FORECAST FOR CAIRNS"
        
        XCTAssertEqual(weatherViewModel.formatForecastHeaderText(), expectedOutcome)
    }
    
    func testFormatWeatherDescription() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "Scattered Clouds"
        
        XCTAssertEqual(weatherViewModel.formatWeatherDescriptionText(), expectedOutcome)
    }
    
    func testFormatWeatherDescriptionUppercase() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "SCATTERED CLOUDS"
        
        XCTAssertEqual(weatherViewModel.formatWeatherDescriptionTextUppercased(), expectedOutcome)
    }
    
    func testFormatTemperatureTextToOneDecimalPlace() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "300.1°"
        
        XCTAssertEqual(weatherViewModel.formatTemperatureText(), expectedOutcome)
    }
    
    func testFormatHighTemperatureTextToOneDecimalPlace() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "300.1°"
        
        XCTAssertEqual(weatherViewModel.formatHighTemperatureTextToOneDecimalPlace(), expectedOutcome)
    }
    
    func testFormatLowTemperatureTextToOneDecimalPlace() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "200.2°"
        
        XCTAssertEqual(weatherViewModel.formatLowTemperatureTextToOneDecimalPlace(), expectedOutcome)
    }
    
    func testFormatLowTemperatureTextToOneDecimalPlaceWithHeading() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutconme = "Low: 200.2°"
        
        XCTAssertEqual(weatherViewModel.formatLowTemperatureTextToOneDecimalPlaceWithHeading(), expectedOutconme)
    }
    
    func testFormatHighTemperatureTextToOneDecimalPlaceWithHeading() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutconme = "High: 300.1°"
        
        XCTAssertEqual(weatherViewModel.formatHighTemperatureTextToOneDecimalPlaceWithHeading(), expectedOutconme)
    }
    
    func testFormatWindText() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "3.6km/h"
        
        XCTAssertEqual(weatherViewModel.formatWindText(), expectedOutcome)
    }
    
    func testFormatWindTextWithHeading() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "Winds: 3.6km/h"
        
        XCTAssertEqual(weatherViewModel.formatWindTextWithHeading(), expectedOutcome)
    }
    
    func testFormatHumidityText() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "74%"
        
        XCTAssertEqual(weatherViewModel.formatHumidityText(), expectedOutcome)
    }
    
    func testFormatHumidityTextWithHeading() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "Humidity: 74%"
        
        XCTAssertEqual(weatherViewModel.formatHumidityTextWithHeading(), expectedOutcome)
    }
    
    func testFormatDetailText() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "Scattered Clouds today with winds of 3.6km/h. The high will be 300.1° with a low of 200.2°"
        
        XCTAssertEqual(weatherViewModel.formatDetailText(), expectedOutcome)
    }
    
    func testFormCloudsText() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "40%"
        
        XCTAssertEqual(weatherViewModel.formatCloudsText(), expectedOutcome)
    }
    
    func testFormatCloudTextWithHeading() {
        let weatherViewModel = WeatherViewModel(weather: weatherDataMock)
        let expectedOutcome = "Clouds: 40%"

        
        XCTAssertEqual(weatherViewModel.formatCloudsTextWithHeading(), expectedOutcome)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
