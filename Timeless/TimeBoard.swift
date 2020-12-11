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
            
            ScrollView {
                
                TimePlatterView()
//                .shadow(color: .black, radius: 1)
                TimePlatterView()
                
            }
            .padding(.top, 10.0)
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
