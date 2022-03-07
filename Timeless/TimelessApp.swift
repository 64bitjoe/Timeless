//
//  TimelessApp.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.
//

import SwiftUI
import CoreData

@main
struct TimelessApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TimeBoard(timer: FirstTimer())
                    .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                    .tabItem {
                        Image(systemName: "clock")
                        Text("TimeBoard")
                    }
//                EditTimer(timer: FirstTimer(), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))
//                    .tabItem {
//                        Image(systemName: "gearshape")
//                        Text("Settings")
//                    }
//                ShareTextView()
//                    .tabItem {
//                        Image(systemName: "pencil")
//                        Text("Placeholder")
//                    }
                Settings()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("Settings")
                    }
            }
        }
    }
}
