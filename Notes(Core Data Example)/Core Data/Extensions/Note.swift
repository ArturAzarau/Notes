//
//  Note.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 08.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import Foundation

extension Note {
    
    var updatedAtAsDate: Date {
        return updatedAt ?? Date()
    }
    
    var createdAtAsDate: Date {
        return createdAt ?? Date()
    }
}
