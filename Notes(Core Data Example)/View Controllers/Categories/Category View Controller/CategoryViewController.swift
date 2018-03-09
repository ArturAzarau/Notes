//
//  CategoryViewController.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 09.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

final class CategoryViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: -
    
    var category: Category?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let name = nameTextField.text, !name.isEmpty {
            category?.name = name
        }
    }
    
    // MARK: - View methods
    
    private func setupView() {
        setupTitle()
        setupNameTextField()
    }
    
    // MARK: -
    
    private func setupNameTextField() {
        nameTextField.text = category?.name
    }
    
    // MARK: -
    
    private func setupTitle() {
        title = "Edit category"
    }
    
}
