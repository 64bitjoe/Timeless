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
    @State private var editTimerShowing = false
    
    @ObservedObject var timer: FirstTimer

    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(countOfTimers, id: \.self ) { countOfTimers in
                        GroupBox() {
                            HStack {
                                Button {
                                    editTimerShowing.toggle()
                                } label: {
                                    Text(timer.emoji)
                                        .font(.largeTitle)
                                }
                                Text(timer.name)
                                    .font(.largeTitle.bold())
                                Spacer()
                            }
                            
                                LazyVStack {
                                    Text("Time Left")
                                        .font(.subheadline)
                                    Text("140 Days")
                                        .font(.largeTitle).bold()
                                    Text("1 Hour, 48 Minutes")
                                }
                               
                                
                        }
//                        .gesture(DragGesture(minimumDistance: 50).onEnded({ _ in
//                            dragCompleted = true
//                        }))
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
        .sheet(isPresented: $editTimerShowing) {
            EditTimer(timer: FirstTimer())
        }
            }

        }
    
}

struct TimeBoard_Previews: PreviewProvider {
    static var previews: some View {
        TimeBoard(timer: FirstTimer())
            .previewDevice("iPhone 13 Pro Max")
    }
}
