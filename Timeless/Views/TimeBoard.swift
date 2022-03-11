//
//  TimeBoard.swift
//  Timeless
//
//  Created by Joe Speakman on 12/6/20.
// Managing the amount of Time Platters to display
// Possible array to hold time patter content?
import SwiftUI
import CoreData

struct TimeBoard: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Countdown.timestamp, ascending: true)], animation: .default)
    
    private var items: FetchedResults<Countdown>
    
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
                if items.count <= 1 {
                    AddTimer()
                        .onTapGesture(count: 1) {
                            editTimerShowing.toggle()
                            getRecordsCount()
                        }

                }else {
                    ForEach(items, id: \.self ) { items in
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
                                    Text(items.emoji!).font(.largeTitle)
                                }
                                Text(items.name!)
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
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(timer.color, lineWidth: 1)
                        )
                        .padding()
                    }
                    
                    
                }
                
            }
            .padding(.top, 7.5)
            .navigationTitle(Constants.Labels.appName)
            .toolbar {
                Button {
                    editTimerShowing.toggle()
                    //TODO: Create Modal to add in countdown.
                } label: {
                    Constants.Images.plus
                }
                
            }
            .sheet(isPresented: $editTimerShowing) {
                EditTimer(timer: FirstTimer(),isModal: .constant(true), isPresented: $editTimerShowing, navBarTitle: .constant(Constants.ModifyTimer.editTimer))
            }
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: [timer.emoji, "\(randomShare().message) \(timer.name)", timer.endDate])
            }
        }
        
    }
    func getRecordsCount() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Countdown")
        do {
            try viewContext.count(for: fetchRequest)
            print(viewContext.count)
            
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct TimeBoard_Previews: PreviewProvider {
    static var previews: some View {
        TimeBoard(timer: FirstTimer())
            .previewDevice("iPhone 13 Pro Max")
    }
}
