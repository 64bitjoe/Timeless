//
//  TabView.swift
//  Timeless
//
//  Created by Joe Speakman on 12/7/20.
// Navication controller

import SwiftUI

struct TimelessTabView: View {
    var body: some View {
        TabView {
            TimeBoard(timer: FirstTimer())
                .tabItem {
                    Image(systemName: "clock")
                    Text("Countdown")
                }
            EditTimer(timer: FirstTimer(), isPresented: .constant(true))
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
    }
        
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TimelessTabView()
    }
}
