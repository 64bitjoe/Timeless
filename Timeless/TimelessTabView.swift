//
//  TabView.swift
//  Timeless
//
//  Created by Joe Speakman on 12/7/20.
// Navication controller

import SwiftUI
import CoreData

struct TimelessTabView: View {
    var body: some View {
        TabView {
            TimeBoard(timer: FirstTimer())
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .tabItem {
                    Image(systemName: "clock")
                    Text("TimeBoard")
                }
            EditTimer(timer: FirstTimer(), isPresented: .constant(true))
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            ShareTextView()
                .environment(\.managedObjectContext, ShareTextPersistenceController.shared.container.viewContext)
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Placeholder")
                }
        }
    }
        
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TimelessTabView()
    }
}
