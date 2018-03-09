//
//  AddNoteViewController.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 08.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit
import CoreData

final class AddNoteViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    
    var managedObjectContext: NSManagedObjectContext?
    
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
        guard let managedObjectContext = managedObjectContext else { return }
        guard let title = titleTextField.text, !title.isEmpty else {
            showAlert(with: "Title Missing", and: "Your note doesn't have a title")
            return
        }
        
        let note = Note(context: managedObjectContext)
        
        note.title = title
        note.createdAt = Date()
        note.updatedAt = Date()
        note.contents = contentsTextView.text
        
        navigationController?.popViewController(animated: true)
    }
}
