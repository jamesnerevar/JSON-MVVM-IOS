//
//  WeatherDataSource.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

class WeatherDataSource: NSObject {
        
    // MARK:  Constructor Properties
    let weather: WeatherModel
    
    // MARK:  Properties
    lazy var weatherViewModel: WeatherViewModel = {
        return WeatherViewModel(weather: weather)
    }()
    
    // MARK:  Life Cycle Methods
    init(weather: WeatherModel) {
        self.weather = weather
    }
}

// MARK:  UICollectionViewDataSource
extension WeatherDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TemperatureCollectionViewCell.reuseID, for: indexPath) as! TemperatureCollectionViewCell
            cell.setTemperatureLabelText(to: weatherViewModel.formatTemperatureText())
            cell.setWeatherDescriptionLabelText(to: weatherViewModel.formatWeatherDescriptionTextUppercased())
            cell.setHighTemperatureLabelText(to: weatherViewModel.formatHighTemperatureTextToOneDecimalPlaceWithHeading())
            cell.setLowTemperatureLabelText(to: weatherViewModel.formatLowTemperatureTextToOneDecimalPlaceWithHeading())
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.reuseID, for: indexPath) as! DetailCollectionViewCell
            cell.setSummaryDescriptionLabelText(to: weatherViewModel.formatDetailText())
            cell.setHumidityLabelText(to: weatherViewModel.formatHumidityTextWithHeading())
            cell.setCoudsLabelText(to: weatherViewModel.formatCloudsTextWithHeading())
            cell.setWindLabelText(to: weatherViewModel.formatWindTextWithHeading())
            return cell
        }
    }
}
