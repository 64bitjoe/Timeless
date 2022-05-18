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
    let competitionDate = NSDateComponents()
    let date = NSDate()
    let calendar = Calendar.current
    let userCalendar = Calendar.current
    @State private var selectedTab = 1
    @State private var editTimerShowing = false
    @State private var pickerValue = 0
    @State private var showShareSheet = false
    @State private var confirmDelete = false
    
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
                            LazyVStack {
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
                                    
                                    if items.gradientEnabled {
                                        Text(items.name)
                                            .font(.largeTitle.bold())
                                            .foregroundStyle(LinearGradient(colors: items.gradient, startPoint: .leading, endPoint: .trailing))
                                    } else {
                                        Text(items.name)
                                            .font(.largeTitle.bold())
                                    }
                                    Spacer()
                                }
                                HStack {

                                    Text(Constants.TimeBoard.inLabel)
                                    Text("\(calculate(targetDate:items.date))")
                                        .font(.largeTitle).bold()
                                    Text(Constants.TimeBoard.timeLeft)
                                }
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
            
            //TODO: Could this info be temp in @State?
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: ["timer.emoji", "\(randomShare().message) \("timer.name")", "timer.endDate"])
            }
        }
//        .onAppear() {
//            timers.objectWillChange
//        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            timers.items.remove(atOffsets: offsets)
        }
    }
    
    func calculate(targetDate: Date) -> String {
        let components = calendar.dateComponents([.hour, .minute, .month, .year, .day], from: targetDate as Date)
        let currentDate = Date()
        let yearint = components.year as Int?
        let monthint = components.month as Int?
        let dayint = components.day as Int?
        
        competitionDate.year = yearint!
        competitionDate.month = monthint!
        competitionDate.day = dayint!
        let competitionDay = userCalendar.date(from: competitionDate as DateComponents)!
        let CompetitionDayDifference = calendar.dateComponents([.day], from: currentDate, to: competitionDay)
        let daysLeft = CompetitionDayDifference.day

        return daysLeft?.description ?? "ERROR"
        
    }
}


struct TimeBoard_Previews: PreviewProvider {
    static var previews: some View {
        TimeBoard().environmentObject(Timers.init())
            .previewDevice("iPhone 13 Pro Max")
    }
}
