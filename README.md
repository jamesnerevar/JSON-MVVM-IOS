# Weather Getter (JSON-MVVM-IOS)
### James Jasenia
Note: You will need to add your own API Key to the WeatherNetworkManager.

![find](/WGAppScreenshots.png)

### Purpose: 
The purpose of this app is to demonstrate my understanding of iOS Development and the variety of technologies avilable through Apple's APIs.

### Technologies:
- UIKit/Xcode
- URL Session
- UICollectionViewCompositionalLayout
- XCTTest

### Architecture:
- MVC/MVVM 
- Coordinator Pattern
- Factory Pattern
- Delegates/Protocols

### Design:
- Programmatic Layout

### Side Note:
- All of the illustrations were created by me.
 
 
 
 
# Architecture:
## Coordinators
I probably wouldn't use a Coordinator with a two screen app, however, as the purpose of this code base is to demonstrate my understanding of different iOS coding practices, I have included it in this code base. With other apps I have developed, that a variety of longer navigation stacks, I have found the coordiantor pattern to be a clean approach that keeps the code decoupled and easy to change. I have attached an example of how I have used the Coorinator pattern in this app.

```

import UIKit

class MainCoordinator: Coordinator {
    
    var childControllers: [Coordinator]?
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        presentCitySearchController()
    }
    
    func presentCitySearchController() {
        //The Factory will create a mock WeatherNetworkManager object if it is in a testing environment, otherwise, it will create the production object.
        let vc = CitySearchController(coordinator: self, networkManager: WeatherNetworkManagerFactory.create())
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func presentWeatherViewController(for weather: WeatherModel) {
        let vc = WeatherViewController(coordinator: self, weather: weather)
        navigationController.pushViewController(vc, animated: true)
    }
}
```

# Network Layer
## URLSession
I have used URLSession and the Result type to handle the NetworkRequest to the Open Weather API. Full disclosure, a lot of my work with RESTFUL APIs has been FETCH requests. I am yet to build any application that handles POST requests.

```
import Foundation

class WeatherNetworkManager: WeatherNetworkManagerProtocol {
    
    //Add API your own key
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
```

## Error Cases

```
import Foundation

enum NetworkError: String, Error {
    
    case invalidURL = "Please enter a valid city name."
    case unableToCompleteNetworkRequest = "Unable to complete Network Request. Please try again later."
    case invalidResponseCode = "Error connecting to the weather services. Please try again later."
    case corruptedData = "The data is corrupted. Please try again later."
    
}
```

# Testing - Still learning :)
## Unit Testing
I am beginnning to appreciate the benefits from unit testing from a workflow perspective. Running unit tests on method with clear inputs and outputs helps improves my confidence that the method, and by extension, the module is performing the role I am expecting it to. In addition, the process of writing unit tests have helped me uncover edge cases I need to consider. I am slowly finding that my Command-U is becoming the new Command-R. Below is a code snipet of testing a View Model object.

```
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
    
    ...
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
```
# UI Testing
This is an example of my UI Testing.

```
import XCTest

class JSON_MVVM_IOSUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launchEnvironment = ["ENVIRONMENT" : "TEST"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good      place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testEmptyCityTextFieldAlert() {
        //Arange
        app.launchEnvironment = ["ENVIRONMENT" : "TEST"]
        app.launch()
        
        //Act
        //On app launch, the CityTextField is still empty.
        app.buttons.element.tap()
        
        //Assert
        //The app will present an alert when the button is presented. This is checking the labels on the alert view.
        XCTAssertTrue(app.staticTexts["AlertHeader"].label == "Invalid City Name")
        XCTAssertTrue(app.staticTexts["AlertSubheader"].label == "Please enter a valid city name")
    }
}
```
