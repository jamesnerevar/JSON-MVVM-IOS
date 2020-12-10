//
//  TemperatureCollectionViewCell.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 12/11/20.
//

import UIKit

class TemperatureCollectionViewCell: UICollectionViewCell {
    
    // MARK:  Properties
    static let reuseID: String = "TemperatureCollectionViewCell"
    
    // MARK:  UI Properties
    lazy var descriptionLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SUNNY"
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 65, weight: .semibold)
        return label
    }()
    
    lazy var lowTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L: 20"
        label.textAlignment = .left
        return label
    }()
    
    lazy var highTemperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "H: 20"
        label.textAlignment = .right
        return label
    }()
    
    // MARK:  Life Cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Accessors
    public func setDescriptionLabelText(to text: String) {
        descriptionLabel.text = text
    }
    
    public func setTemperatureLabelText(to text: String) {
        temperatureLabel.text = text
    }
    
    public func setLowTemperatureText(to text: String) {
        lowTemperatureLabel.text = text
    }
    
    public func setHighTemperatureText(to text: String) {
        highTemperatureLabel.text = text
    }
    
    // MARK:  View Confiruation Methods
    private func setupView() {
        backgroundColor = .systemGray6
        addTemperatureLabel()
        addDescriptionLabel()
        addLowTemperatureLabel()
        addHighTemperatureLabel()
    }
    
    // MARK:  Constraints
    private func addTemperatureLabel() {
        addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            temperatureLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            temperatureLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            temperatureLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65)
        ])
    }
    
    private func addDescriptionLabel() {
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.bottomAnchor.constraint(equalTo: temperatureLabel.topAnchor, constant: -2.5),
            descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    

    
    private func addLowTemperatureLabel() {
        addSubview(lowTemperatureLabel)
        
        NSLayoutConstraint.activate([
            lowTemperatureLabel.leadingAnchor.constraint(equalTo: temperatureLabel.leadingAnchor),
            lowTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor)
        ])
    }
    
    private func addHighTemperatureLabel() {
        addSubview(highTemperatureLabel)
        
        NSLayoutConstraint.activate([
            highTemperatureLabel.trailingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor),
            highTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor)
        ])
    }
}
