//
//  MenuBarLinksApp.swift
//  MenuBarLinks
//
//  Created by Dhanuka Perera on 18/02/2023.
//

import SwiftUI

@main
struct MenuBarLinksApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
