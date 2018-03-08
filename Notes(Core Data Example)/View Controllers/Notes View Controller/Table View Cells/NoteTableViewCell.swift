//
//  NoteTableViewCell.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 08.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

final class NoteTableViewCell: UITableViewCell {
    
    // MARK: - Static properties
    
    static let reuseIdentifier = "NoteTableViewCell"
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
