//
//  TimeBoard.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.
// Managing the amount of Time Platters to display

import SwiftUI

struct TimeBoard: View {
    @State private var selectedTab = 1
    
    var body: some View {
        NavigationView{
        ZStack {
            
            VStack(alignment: .leading, spacing: 20) {
                TimePlatterView()
                .frame(height: 300)
                .position(x: 215, y: 100)
                .shadow(color: .black, radius: 1)
                TimePlatterView()
                    .frame(height:300)
                
            }
            }
        .navigationTitle("Timeless")
        }
    }
}

struct TimeBoard_Previews: PreviewProvider {
    static var previews: some View {
        TimeBoard()
            .previewDevice("iPhone 12 Pro Max")
    }
}
