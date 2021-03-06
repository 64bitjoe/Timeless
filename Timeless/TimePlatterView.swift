//
//  SwiftUIView.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.

// Creating the Countdown Timer Instance

import SwiftUI

struct TimePlatterView: View {
    var body: some View {
        GroupBox() {
            HStack {
                // Image Needs to get a Picker for user choice
                Image(systemName: "square.and.pencil")
                    .font(Font.system(.largeTitle).bold())
                Spacer()
                // Example Text is for Label for Object name
                Text("Example")
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

//struct shareSheet : UIViewControllerRepresentable {
//
//    // Shared Data
//    var items : [Any]
//
//    func makeUIViewController(context: Context) -> some UIActivityViewController {
//        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
//        return controller
//    }
//    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
//
//    }
//}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimePlatterView()
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}

