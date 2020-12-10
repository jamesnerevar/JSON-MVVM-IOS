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
            
            if sectionNumber == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.98))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(0), trailing: .fixed(0), bottom: .fixed(0))


                //Groups
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                       heightDimension: .fractionalHeight(0.15))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(4), top: .fixed(4), trailing: .fixed(4), bottom: .fixed(2))

                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            } else if sectionNumber == 1 {
                //Items
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.98))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(5), trailing: .fixed(0), bottom: .fixed(5))
                
                //Groups
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                       heightDimension: .fractionalHeight(0.4))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(4), top: .fixed(2), trailing: .fixed(4), bottom: .fixed(2))


                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                
                return section
            } else if sectionNumber == 2 {
                //Items
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.98))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(5), trailing: .fixed(0), bottom: .fixed(5))
                
                //Groups
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                       heightDimension: .fractionalHeight(0.2))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(4), top: .fixed(2), trailing: .fixed(4), bottom: .fixed(2))
                group.interItemSpacing = .fixed(5)


                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                
                return section
            } else {
                //Items
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.98))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(0), top: .fixed(5), trailing: .fixed(0), bottom: .fixed(5))
                
                //Groups
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                       heightDimension: .fractionalHeight(0.2))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(4), top: .fixed(4), trailing: .fixed(4), bottom: .fixed(0))
                group.interItemSpacing = .fixed(5)


                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                
                return section
            }
        }
    }
}
