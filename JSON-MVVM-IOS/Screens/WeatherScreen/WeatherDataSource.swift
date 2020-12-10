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
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 3
        default:
            return 2
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DescriptionCollectionViewCell.reuseID, for: indexPath) as! DescriptionCollectionViewCell
            cell.setHeaderLabelText(to: weatherViewModel.formatForecastHeaderText())
            return cell
            
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TemperatureCollectionViewCell.reuseID, for: indexPath) as! TemperatureCollectionViewCell
            
            cell.setDescriptionLabelText(to: weatherViewModel.formatWeatherDescriptionText())
            cell.setTemperatureLabelText(to: weatherViewModel.formatTemperatureText())
            cell.setLowTemperatureText(to: weatherViewModel.formatLowTemperatureTextToOneDecimalPlace())
            cell.setHighTemperatureText(to: weatherViewModel.formatHighTemperatureTextToOneDecimalPlace())
            
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderValueCollectionViewCell.reuseID, for: indexPath) as! HeaderValueCollectionViewCell
            
            if indexPath.row == 0 {
                cell.setHeaderLabelText(to: "WIND")
                cell.setValueLabelText(to: weatherViewModel.formatWindText())
            } else if indexPath.row == 1 {
                cell.setHeaderLabelText(to: "HUMIDITY")
                cell.setValueLabelText(to: weatherViewModel.formatHumidityText())
            } else {
                cell.setHeaderLabelText(to: "CLOUDS")
                cell.setValueLabelText(to: weatherViewModel.formatCloudsText())
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderValueCollectionViewCell.reuseID, for: indexPath) as! HeaderValueCollectionViewCell
            
            if indexPath.row == 0 {
                cell.setHeaderLabelText(to: "SUNRISE")
                cell.setValueLabelText(to: weatherViewModel.formatSunriseText())
            } else {
                cell.setHeaderLabelText(to: "SUNSET")
                cell.setValueLabelText(to: weatherViewModel.formatSunsetText())
            }
            
            return cell
        }
    }    
}
