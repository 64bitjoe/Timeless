//
//  SwiftUIView.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.

// Creating the Countdown Timer Instance

import SwiftUI

struct TimePlatterView: View {
    @ObservedObject var timer: FirstTimer
    var body: some View {
        GroupBox() {
            HStack {
                // Image Needs to get a Picker for user choice
                Image(systemName: "square.and.pencil")
                    .font(Font.system(.largeTitle).bold())
                Spacer()
                // Example Text is for Label for Object name
                Text(timer.name)
                Spacer()
                //Button needs function added
                Button(action: {
                    print("Put function info here")
                }) {
                    // Button Color Needs Changing.
                    Image(systemName: "square.and.arrow.up")
                        .font(Font.system(.largeTitle).bold())
                
                }
            }
            
                VStack {
                    Text("Time Left")
                        .font(.headline)
                    Text("140 Days")
                        .font(.largeTitle).bold()
                    Text("1 Hour, 48 Minutes")
                }
               
                
        }
        
        .padding()
        
        
    }
    
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimePlatterView(timer: FirstTimer())
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}

