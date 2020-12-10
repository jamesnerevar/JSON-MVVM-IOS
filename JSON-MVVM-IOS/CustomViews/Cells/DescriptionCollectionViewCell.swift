//
//  DescriptionCollectionViewCell.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 12/11/20.
//

import UIKit

class DescriptionCollectionViewCell: UICollectionViewCell {
    
    // MARK:  Properties
    static let reuseID: String = "DescriptionCollectionViewCell"
    
    // MARK:  UI Properties
    lazy var headerLabel: HeaderLabel = {
        let label = HeaderLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "FORECAST FOR MELBOURNE"
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "A text string, also known as a string or simply as text, is a group of characters that are used as data in a spreadsheet program. Text strings are most often comprised of words."
        textView.backgroundColor = .clear
        return textView
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
    public func setHeaderLabelText(to text: String) {
        headerLabel.setHeaderLabelText(to: text)
    }
    
    // MARK:  View Confiruation Methods
    private func setupView() {
        backgroundColor = .systemGray6
        addHeaderLabel()
        addTextView()
    }
    
    // MARK:  Constraints
    private func addHeaderLabel() {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.5),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.5)
        ])
    }
    
    private func addTextView() {
        addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 2.5),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2.5),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2.5),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2.5)
        ])
    }
}
