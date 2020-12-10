//
//  ViewController.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

class CitySearchController: UIViewController {

    // MARK:  Properties

    
    // MARK:  UI Properties
    private let mainView = CitySearchView()
    
    // MARK:  Constructor Properties
    let coordinator: MainCoordinator
    let networkManager: WeatherNetworkManagerProtocol
    
    // MARK:  Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureButtons()
    }
    
    init(coordinator: MainCoordinator, networkManager: WeatherNetworkManagerProtocol) {
        self.coordinator = coordinator
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  View Configuration Methods
    private func setupView() {
        view = mainView
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Find City"
    }
    
    // MARK:  Button Configuration Methods
    private func configureButtons() {
        configureWeatherButton()
    }
    
    private func configureWeatherButton() {
        mainView.weatherButton.addTarget(self, action: #selector(weatherButtonTapped), for: .touchUpInside)
    }
    
    @objc private func weatherButtonTapped() {
        guard let text = mainView.cityTextField.text, !text.isEmpty else {
            //UI Test:
            //Assert that a UIAlert is presented
            return
        }
        
        getWeatherData(for: text)
    }
    
    // MARK:  Data  Management Methods
    private func  getWeatherData(for cityName: String) {
        networkManager.getWeatherData(for: cityName) { (result) in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.coordinator.presentWeatherViewController(for: weather)
                }
            case .failure(let error):
                print(error.rawValue)
            }
        }
    }
}
