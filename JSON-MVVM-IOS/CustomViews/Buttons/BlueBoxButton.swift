//
//  BlueBoxButton.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 14/12/20.
//

import UIKit

class BlueBoxButton: UIButton {
    
    // MARK:  Constructor Properties
    let titleText: String
    
    // MARK:  Life Cycle Methods
    init(titleText: String) {
        self.titleText = titleText
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Setup Method
    private func setupView() {
       translatesAutoresizingMaskIntoConstraints = false
       setTitle(titleText, for: .normal)
       backgroundColor = .systemBlue
       applyCornerRadius(of: 12)
       titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
       layer.zPosition = 1
    }
}
