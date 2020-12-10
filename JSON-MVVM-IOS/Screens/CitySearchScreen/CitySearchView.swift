//
//  EnterCityView.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

class CitySearchView: UIView {
    
    // MARK:  UI Properties
    lazy var sunBackgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: K.AssetKeys.SUN_BACKGROUND_IMAGE_KEY))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.zPosition = 0
        return imageView
    }()
    
    lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.placeholder = "Enter City Name"
        textField.backgroundColor = .white
        textField.applyCornerRadius(of: 12)
        textField.layer.zPosition = 1
        return textField
    }()
    
    lazy var weatherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get Weather Information", for: .normal)
        button.backgroundColor = .systemBlue
        button.applyCornerRadius(of: 12)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.zPosition = 1
        return button
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
    public func getCityTextFieldText() -> String? {
        return cityTextField.text
    }
    
    // MARK:  View Configuration Methods
    private func setupView() {
        backgroundColor = .white
        addEarthImageView()
        addCityTextField()
        addWeatherButton()
    }
    
    // MARK:  Constraints
    private func addEarthImageView() {
        addSubview(sunBackgroundImageView)
        
        NSLayoutConstraint.activate([
            sunBackgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            sunBackgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sunBackgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            sunBackgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func addCityTextField() {
        addSubview(cityTextField)
        
        NSLayoutConstraint.activate([
            cityTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            cityTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint(item: cityTextField, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.1, constant: 0).isActive = true
    }
    
    private func addWeatherButton() {
        addSubview(weatherButton)
        
        NSLayoutConstraint.activate([
            weatherButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            weatherButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            weatherButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            weatherButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

