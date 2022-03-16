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
                TimeBoard()
                    .environmentObject(Timers())
                    .tabItem {
                        Image(systemName: "clock")
                        Text("TimeBoard")
                    }
                Settings()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("Settings")
                    }
            }
        }
    }
}
