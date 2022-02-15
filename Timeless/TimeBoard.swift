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
    @State private var showShareSheet = false
    
    @ObservedObject var timer: FirstTimer
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(countOfTimers, id: \.self ) { countOfTimers in
                    GroupBox() {
                        HStack {
                            Menu {
                                Button {
                                    showShareSheet.toggle()
                                    
                                } label: {
                                    Constants.Images.share
                                    Text(Constants.TimeBoard.shareLabel)
                                }
                                Button {
                                    editTimerShowing.toggle()
                                } label: {
                                    Constants.Images.edit
                                    Text(Constants.TimeBoard.editLabel)
                                }
                            } label: {
                                Text(timer.emoji).font(.largeTitle)
                            }
                            Text(timer.name)
                                .foregroundStyle(Constants.Gradient.gradient)
                                .font(.largeTitle.bold())
                            Spacer()
                        }
                        
                        LazyVStack {
                            Text(Constants.TimeBoard.timeLeft)
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
                AddTimer()
                    .onTapGesture(count: 1) {
                        editTimerShowing.toggle()
                    }
            }
            .padding(.top, 7.5)
            .navigationTitle(Constants.Labels.appName)
            .toolbar {
                Button {
                    editTimerShowing.toggle()
                    //TODO: Create Modal to add in countdown.
                    countOfTimers.append(countOfTimers.count+1)
                } label: {
                    Constants.Images.plus
                }
                
            }
            .sheet(isPresented: $editTimerShowing) {
                EditTimer(timer: FirstTimer(), isPresented: $editTimerShowing)
            }
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: [timer.emoji, timer.name, timer.endDate])
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
