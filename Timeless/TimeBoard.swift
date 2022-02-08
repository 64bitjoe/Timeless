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
    @State private var pickerValue = 0
    
    @ObservedObject var timer: FirstTimer
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(countOfTimers, id: \.self ) { countOfTimers in
                    GroupBox() {
                        HStack {
                            Menu {
                                Button {
                                    print("Share Sheet here")
                                } label: {
                                    Constants.Images.share
                                    Text("Share")
                                }
                                Button {
                                    editTimerShowing.toggle()
                                } label: {
                                    Constants.Images.edit
                                    Text("Edit Timer")
                                }
                            } label: {
                            Text(timer.emoji).font(.largeTitle)
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
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(timer.color, lineWidth: 1)
                    )
                    
                    .padding()
                    
                }
                
                
            }
            .padding(.top, 7.5)
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
