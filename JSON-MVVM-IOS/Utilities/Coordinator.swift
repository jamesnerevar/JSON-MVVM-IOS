//
//  Coordinator.swift
//  JSON-MVVM-IOS
//
//  Created by James Jasenia on 11/11/20.
//

import UIKit

protocol Coordinator {
    
    var childControllers: [Coordinator]? { get set }
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
    
}
