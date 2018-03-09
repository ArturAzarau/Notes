//
//  NoteViewController.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 09.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

final class NoteViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    
    var note: Note?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        func updateNote() {
            
            guard let note = note else { return }
            
            if let title = titleTextField.text, !title.isEmpty && note.title != title {
                note.title = title
            }
            
            if note.contents != contentsTextView.text {
                note.contents = contentsTextView.text
            }
            
            if note.isUpdated {
                note.updatedAt = Date()
            }
        }
        
        updateNote()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // MARK: - View methods
    
    private func setupView() {
        
        func setupTitle() {
            title = "Edit Note"
        }
        
        func setupTitleTextField() {
            titleTextField.text = note?.title
        }
        
        func setupContentsTextView() {
            contentsTextView.text = note?.contents
        }
        
        setupTitle()
        setupTitleTextField()
        setupContentsTextView()
    }
    
    
}
