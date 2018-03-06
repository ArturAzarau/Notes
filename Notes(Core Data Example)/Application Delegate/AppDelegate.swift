//
//  AppDelegate.swift
//  Notes(Core Data Example)
//
//  Created by Артур Азаров on 06.03.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let coreDataManager = CoreDataManager(modelName: "Notes")
        print(coreDataManager.managedObjectContext)
        return true
    }
}

