//
//  TimeBoard.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.
// Managing the amount of Time Platters to display
// Possible array to hold time patter content?
import SwiftUI

struct TimeBoard: View {
    let Const = Constants.TimeBoard.self
    
    @State private var selectedTab = 1
    @State private var countOfTimers = [0]
    @ObservedObject var timer: FirstTimer

    var body: some View {
        NavigationView{
            ScrollView{
//            List {
                ForEach(countOfTimers, id: \.self ) { countOfTimers in
                        GroupBox() {
                            HStack {
                                Text(timer.emoji)
                                    .font(.largeTitle)
//                                    .multilineTextAlignment(.center)
                                Spacer()
                                // Example Text is for Label for Object name
                                Text(timer.name)
                                    .font(.headline.bold())
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
                    
                
//                }
            }
            .padding(.top, 10.0)
            .navigationTitle(Constants.Labels.appName)
        .toolbar {
            Button {
                //TODO: Create Modal to add in countdown.
                countOfTimers.append(countOfTimers.count+1)
            } label: {
                Constants.Images.plus
            }

        }
            }

        }
    
}

struct TimeBoard_Previews: PreviewProvider {
    static var previews: some View {
        TimeBoard(timer: FirstTimer())
            .previewDevice("iPhone 12 Pro Max")
    }
}
