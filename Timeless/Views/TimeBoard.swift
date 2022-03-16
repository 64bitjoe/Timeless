//
//  TimeBoard.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.
// Managing the amount of Time Platters to display
// Possible array to hold time patter content?

import SwiftUI

struct TimeBoard: View {
    
    @EnvironmentObject var timers: Timers

    let Const = Constants.TimeBoard.self
    
    @State private var selectedTab = 1
    @State private var editTimerShowing = false
    @State private var pickerValue = 0
    @State private var showShareSheet = false
    
    var body: some View {
        NavigationView{
            List{
                if $timers.items.count <= 0 {
                    AddTimer()
                        .onTapGesture(count: 1) {
                            editTimerShowing.toggle()
                        }

                }else {
                    ForEach(timers.items) { items in
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
                                    Text(items.emoji).font(.largeTitle)
                                }
                                Text(items.name)
                                    .foregroundStyle(Constants.Gradients.gradient)
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
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(items.color, lineWidth: 2)
                        )
                        .padding([.leading, .trailing], 0.5)
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .listStyle(InsetListStyle())
            .listRowInsets(EdgeInsets())
            .padding(.top, 7.5)
            .navigationTitle(Constants.Labels.appName)
            .toolbar {
                Button {
                    editTimerShowing.toggle()
                } label: {
                    Constants.Images.plus
                }
                
            }
            .sheet(isPresented: $editTimerShowing) {
                EditTimer(isModal: .constant(true), isPresented: $editTimerShowing, navBarTitle: .constant(Constants.ModifyTimer.editTimer))
            }
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: ["timer.emoji", "\(randomShare().message) \("timer.name")", "timer.endDate"])
            }
        }
        
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            timers.items.remove(atOffsets: offsets)
            
        }
    }
}


struct TimeBoard_Previews: PreviewProvider {
    static var previews: some View {
        TimeBoard()
            .previewDevice("iPhone 13 Pro Max")
    }
}
