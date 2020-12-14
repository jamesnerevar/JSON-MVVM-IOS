//
//  AlertViewController.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 14/12/20.
//

import UIKit

class AlertViewController: UIViewController {

    // MARK:  UI Properties
    let mainView = AlertView()
    
    // MARK:  Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureButton()
    }
    
    // MARK:  Setup Methods
    private func setupView() {
        view = mainView
    }
    
    // MARK:  Button Configuration
    private func configureButton() {
        mainView.alertButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        dismiss(animated: true)
    }
}
