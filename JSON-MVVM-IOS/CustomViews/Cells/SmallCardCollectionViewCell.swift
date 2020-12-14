//
//  SmallCardCollectionViewCell.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 12/11/20.
//

import UIKit

class HeaderValueCollectionViewCell: UICollectionViewCell {
    
    // MARK:  Properties
    static let reuseID: String = ""
    
    // MARK:  UI Properties
    lazy var headerLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK:  View Confiruation Methods
    private func setupView() {
        backgroundColor = .white
        addHeaderLabel()
        addValueLabel()
    }
    
    // MARK:  Accessors
    public func setHeaderLabelText(to text: String) {
        headerLabel.setHeaderLabelText(to: text)
    }
    
    public func setValueLabelText(to text: String) {
        valueLabel.text = text
    }
    
    // MARK:  Constraints
    private func addHeaderLabel() {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.5),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.5)
        ])
    }
    
    private func addValueLabel() {
        addSubview(valueLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
