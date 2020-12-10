//
//  WeatherViewController.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK:  Properties
    lazy var dataSource: WeatherDataSource = {
        return WeatherDataSource(weather: weather)
    }()
    
    // MARK:  UI Properties
    let mainView = WeatherView()
    
    // MARK:  Constructor Properties
    let coordinator: MainCoordinator
    let weather: WeatherModel
    
    // MARK:  Life  Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addDataSources()
    }
    
    init(coordinator: MainCoordinator, weather: WeatherModel) {
        self.coordinator = coordinator
        self.weather = weather
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  View Configuration Method
    private func setupView() {
        view = mainView
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let cityName = weather.name
        title = cityName
    }
    
    // MARK:  Data Source
    private func addDataSources() {
        mainView.collectionView.dataSource = dataSource
    }
}
