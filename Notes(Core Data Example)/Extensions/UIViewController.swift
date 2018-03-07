//
//  UIViewController.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 08.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - ALerts
    
    func showAlert(with title: String, and message: String) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Configure Alert Controller
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        // Present Alert Controller
        present(alertController, animated: true)
    }
}
