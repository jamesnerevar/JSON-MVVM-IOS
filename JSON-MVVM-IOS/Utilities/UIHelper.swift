//
//  UIHelper.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

struct UIHelper {
    
    func createWeatherCollectionViewCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, environment) -> NSCollectionLayoutSection? in
            
            let _ = environment.container.contentSize.width
            let _ = environment.container.contentSize.height
            
            //Item
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            //Groups
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            //Section
            let section = NSCollectionLayoutSection(group: group)
            
            return section
        }
    }
    
    func createAlertViewController() -> AlertViewController {
        let vc = AlertViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        return vc
    }
}
