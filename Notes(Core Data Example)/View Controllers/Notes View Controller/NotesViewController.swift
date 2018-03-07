//
//  ViewController.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 06.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit
import CoreData

final class NotesViewController: UIViewController {
    
    // MARK: - Segues
    
    private enum Segue {
        
        static let AddNote = "AddNote"
        
    }
    
    // MARK: - Properties
    
    private let coreDataManager = CoreDataManager(modelName: "Notes")
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case Segue.AddNote:
            guard let destination = segue.destination as? AddNoteViewController else { return }
            
            destination.managedObjectContext = coreDataManager.managedObjectContext
        default:
            break
        }
    }
}

