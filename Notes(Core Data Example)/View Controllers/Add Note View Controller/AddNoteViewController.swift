//
//  AddNoteViewController.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 08.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

final class AddNoteViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Note"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // Show Keyboard
        titleTextField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    @IBAction func save(sender: UIBarButtonItem) {
        
    }
}
