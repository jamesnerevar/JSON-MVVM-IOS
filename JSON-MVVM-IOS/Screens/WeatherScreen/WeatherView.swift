//
//  WeatherView.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

class WeatherView: UIView {
    
    // MARK:  UI Properties
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper().createWeatherCollectionViewCompositionalLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.reuseID)
        collectionView.register(DescriptionCollectionViewCell.self, forCellWithReuseIdentifier: DescriptionCollectionViewCell.reuseID)
        collectionView.register(TemperatureCollectionViewCell.self, forCellWithReuseIdentifier: TemperatureCollectionViewCell.reuseID)
        collectionView.register(HeaderValueCollectionViewCell.self, forCellWithReuseIdentifier: HeaderValueCollectionViewCell.reuseID)

        collectionView.backgroundColor = .white
        collectionView.isUserInteractionEnabled = false
        
        return collectionView
    }()
    
    // MARK:  Life Cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  View Configuration Methods
    private func setupView() {
        backgroundColor = .white
        addCollectionView()
    }
    
    // MARK:  Constraints
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
