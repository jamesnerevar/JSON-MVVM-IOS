//
//  AlertView.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 14/12/20.
//

import UIKit

class AlertView: UIView {
    
    // MARK:  UIProperties
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = .white
        return containerView
    }()
    
    lazy var alertHeader: GenericLabel = {
        let label = GenericLabel(fontSize: 25, fontWeight: .semibold, textAligned: .center)
        label.accessibilityIdentifier = "AlertHeader"
        return label
    }()
    
    lazy var alertSubheader: GenericLabel = {
        let label = GenericLabel(fontSize: 18, fontWeight: .thin, textAligned: .center)
        label.accessibilityIdentifier = "AlertSubheader"
        label.numberOfLines = 3
        return label
    }()
    
    let alertButton = BlueBoxButton(titleText: "Okay")
    
    // MARK:  Life Cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:  Setup Methods
    private func setupView() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.80)
        isOpaque = false
        addContainerView()
    }
    
    // MARK:  Constraints
    private func addContainerView() {
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 300),
            containerView.heightAnchor.constraint(equalToConstant: 180),
        ])
        
        addAlertHeader()
        addSubheader()
        addButton()
    }
    
    private func addAlertHeader() {
        containerView.addSubview(alertHeader)
        alertHeader.text = "Invalid City Name"
        
        
        NSLayoutConstraint.activate([
            alertHeader.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            alertHeader.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            alertHeader.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    private func addSubheader() {
        addSubview(alertSubheader)
        alertSubheader.text = "Please enter a valid city name"
        
        NSLayoutConstraint.activate([
            alertSubheader.topAnchor.constraint(equalTo: alertHeader.bottomAnchor, constant: 10),
            alertSubheader.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            alertSubheader.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    private func addButton() {
        containerView.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            alertButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            alertButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            alertButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8),
            alertButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
