//
//  CategoryTableViewCell.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 09.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {

    // MARK: - Peroperties
    
    static let reuseIdentifier = "CategoryTableViewCell"
    
    // MARK: -
    
    @IBOutlet weak var nameLabel: UILabel!
}
