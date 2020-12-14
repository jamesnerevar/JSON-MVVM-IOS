//
//  TemperatureCollectionViewCell.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 10/12/20.
//

import UIKit

class TemperatureCollectionViewCell: UICollectionViewCell {
    
    // MARK:  Properties
    static let reuseID: String = "TemperatureCollectionViewCell"
    
    // MARK:  UI Properties
    let temperatureLabel = GenericLabel(fontSize: 90, fontWeight: .semibold, textAligned: .center)
    let weatherDescriptionLabel = GenericLabel(fontSize: 20, fontWeight: .light, textAligned: .center)
    let lowTemperatureLabel = GenericLabel(fontSize: 20, fontWeight: .light, textAligned: .left)
    let highTemperatureLabel = GenericLabel(fontSize: 20, fontWeight: .light, textAligned: .right)
    
    // MARK:  Life Cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Accessors
    func setTemperatureLabelText(to text: String) { temperatureLabel.text = text }
    func setWeatherDescriptionLabelText(to text: String) { weatherDescriptionLabel.text = text }
    func setLowTemperatureLabelText(to text: String) { lowTemperatureLabel.text = text }
    func setHighTemperatureLabelText(to text: String) { highTemperatureLabel.text = text }
    
    // MARK:  Setup Methods
    private func setupView() {
        configureBackgroundView()
        addTemperatureLabel()
        addWeatherDescriptionLabel()
        addLowTemperatureLabel()
        addHighTemperatureLabel()
    }
    
    private func configureBackgroundView() {
        let backgroundImage = UIImageView(image: UIImage(named: K.AssetKeys.YELLOW_DRIP_BIRD))
        backgroundView = backgroundImage
    }
    
    // MARK:  Constraints
    private func addTemperatureLabel() {
        addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func addWeatherDescriptionLabel() {
        addSubview(weatherDescriptionLabel)
        
        NSLayoutConstraint.activate([
            weatherDescriptionLabel.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor),
            weatherDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    private func addLowTemperatureLabel() {
        addSubview(lowTemperatureLabel)
        
        NSLayoutConstraint.activate([
            lowTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            lowTemperatureLabel.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor)
        ])
    }
    
    private func addHighTemperatureLabel() {
        addSubview(highTemperatureLabel)
        
        NSLayoutConstraint.activate([
            highTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            highTemperatureLabel.trailingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor)
        ])
    }
}
