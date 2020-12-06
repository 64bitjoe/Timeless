//
//  TimelessApp.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.
//

import SwiftUI

@main
struct TimelessApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
