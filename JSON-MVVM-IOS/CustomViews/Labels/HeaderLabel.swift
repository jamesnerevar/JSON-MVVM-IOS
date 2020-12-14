//
//  HeaderLabel.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 12/11/20.
//

import UIKit

class HeaderLabel: UILabel {

    // MARK:  Constructor Properties
    var headerText: String?
    
    // MARK:  Life Cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init(headerText: String) {
        self.headerText = headerText
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Accessors
    func setHeaderLabelText(to text: String) {
        self.text = text
    }
    
    // MARK:  View Configuration Methods
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        textColor = .systemGray
        
        if let headerText = headerText { text = headerText }
    }
}
