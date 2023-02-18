//
//  Persistence.swift
//  MenuBarLinks
//
//  Created by Dhanuka Perera on 18/02/2023.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()



    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MenuBarLinks")
       
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
