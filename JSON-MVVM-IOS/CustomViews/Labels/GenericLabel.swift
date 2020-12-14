//
//  GenericLabel.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 14/12/20.
//

import UIKit

class GenericLabel: UILabel {
    
    // MARK:  Contructor Properties
    let fontSize: CGFloat
    let fontWeight: UIFont.Weight
    let textAligned: NSTextAlignment
    
    // MARK:  Life Cycle Methods
    init(fontSize: CGFloat, fontWeight: UIFont.Weight, textAligned: NSTextAlignment) {
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.textAligned = textAligned
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Setup Method
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        textAlignment = textAligned
    }
}
