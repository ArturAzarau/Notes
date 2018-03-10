//
//  NoteViewController.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 09.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit
import CoreData

final class NoteViewController: UIViewController {
    
    // MARK: - Segues
    
    private enum Segue {
        
        static let Categories = "Categories"
        
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var note: Note?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNotificationHandling()
        setupCategoryLabel()
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
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case Segue.Categories:
            guard let destination = segue.destination as? CategoriesViewController else {
                return
            }
            
            destination.note = self.note
            print("destination configured")
        default: break
        }
        
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
    
    // MARK: -
    
    private func setupTitleTextField() {
        // Configure Title Text Field
        titleTextField.text = note?.title
    }
    
    private func setupContentsTextView() {
        // Configure Contents Text View
        contentsTextView.text = note?.contents
    }
    
    private func setupCategoryLabel() {
        updateCategoryLabel()
    }
    
    private func updateCategoryLabel() {
        categoryLabel.text = note?.category?.name ?? "No Category"
    }
    
    private func setupNotificationHandling() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(managedObjectContextDidChange(_:)),
                                       name: Notification.Name.NSManagedObjectContextObjectsDidChange,
                                       object: note?.managedObjectContext)
    }
    
    @objc private func managedObjectContextDidChange(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let updates = userInfo[NSUpdatedObjectsKey] as? Set<NSManagedObject> else { return }
        
        if (updates.filter { return $0 == note }).count > 0 {
            updateCategoryLabel()
        }
    }
    
}
