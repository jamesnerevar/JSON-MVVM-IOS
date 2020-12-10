//
//  ViewController.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

class CitySearchController: UISearchController {

    // MARK:  Properties
    
    
    // MARK:  UI Properties
    private let mainView = EnterCityView()
    
    // MARK:  Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK:  View Configuration Methods
    private func setupView() {
        view = mainView
        configureNavigationController()
    }
    
    // MARK:  Delegates
    private func addDelegates() {
        mainView.tableView.delegate = self
    }
    
    // MARK:  Data Sources
    private func addDataSources() {
        
    }
    
    
    private func configureNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Enter City Name"
    }

    
    @objc private func getTemperatureButtonTapped() {
        WeatherNetworkManager.shared.getWeatherData(for: "Melbourne") { (result) in
            switch result {
            case .success(let data):
                print(data.main.temp)
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}

