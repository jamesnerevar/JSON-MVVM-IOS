//
//  MediumCollectionViewCell.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 12/11/20.
//

import UIKit

class MediumCollectionViewCell: UICollectionViewCell {
 
    // MARK:  Properties
    static let reuseID: String = "MediumCollectionViewCell"
    
    // MARK:  UI Properties

    
    // MARK:  Life Cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  View Confiruation Methods
    private func setupView() {
        
    }
    
    // MARK:  Constraints
    
}
