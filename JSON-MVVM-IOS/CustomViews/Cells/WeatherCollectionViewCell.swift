//
//  CityTableViewCell.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    // MARK:  Properties
    static let reuseID: String = "WeatherCollectionViewCell"
    
    // MARK:  UI Properties
    lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
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
    func setCityLabelText(to text: String) {
        cityLabel.text = text
    }
    
    // MARK:  View Configuration Methods
    private func setupView() {
        backgroundColor = .orange
        addCityLabel()
        applyCornerRadius(of: 4)
    }
    
    // MARK:  Constraints
    private func addCityLabel() {
        addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            cityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            cityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        ])
    }
}
