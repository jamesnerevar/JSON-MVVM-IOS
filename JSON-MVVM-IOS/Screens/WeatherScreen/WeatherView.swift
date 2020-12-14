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
        collectionView.register(TemperatureCollectionViewCell.self, forCellWithReuseIdentifier: TemperatureCollectionViewCell.reuseID)
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.reuseID)
        collectionView.isPagingEnabled = true
        
        //This property will allow the UICollectionView content to sit under the navigation controller.
        collectionView.contentInsetAdjustmentBehavior = .never
        
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
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
