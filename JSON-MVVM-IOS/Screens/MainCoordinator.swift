//
//  MainCoordinator.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

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
