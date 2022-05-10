//
//  EditTimer.swift
//  Timeless
//
//  Created by Joe Speakman on 5/10/21.
//

import SwiftUI

struct EditTimer: View {
    
    @EnvironmentObject var timerObject: Timers
    
    @Binding var isModal: Bool
    @Binding var isPresented: Bool
    @Binding var navBarTitle: String
    var body: some View {
        
        VStack {
            if isModal {
                NavigationView {
                    EditTimerBody(timer: timerObject, isPresented: $isPresented, navBarTitle: $navBarTitle)
                }
            } else {
                EmptyView()
                EditTimerBody(timer: timerObject, isPresented: $isPresented, navBarTitle: $navBarTitle)
            }
        }

    }
}
struct EditTimerBody: View {
    @ObservedObject var timer = Timers()
    @Binding var isPresented: Bool
    @Binding var navBarTitle: String
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var missingValueAlert = false
    @State private var gradientToggle = false
    @State private var pickerValue = 0
    @State private var name = Constants.emptyString
    @State private var emoji = Constants.emptyString
    @State private var color = Color.gray
    @State private var gradientColor0 = Color.clear
    @State private var gradientColor1 = Color.clear
    @State private var gradientColor2 = Color.clear
    @State private var countdownDate = Date()
    @State private var finishedInput = false
    
    var body: some View {
        VStack {
            Form {
                Section (header: Text(Constants.ModifyTimer.firstSectionHeader)) {
                    TextField(Constants.ModifyTimer.coutndownTextFeild, text: $name)
                        .font(.title2.weight(.semibold))
                    TextField(Constants.ModifyTimer.emojiTextFeild, text: $emoji)
                    
                    ColorPicker(Constants.ModifyTimer.colorLabel, selection: $color, supportsOpacity: false)
                    
                    Toggle(Constants.ModifyTimer.gradientLabel, isOn: $gradientToggle)
                    
                }
                if gradientToggle {
                    Section (header: Text("Gradient Colors")) {
                        ColorPicker(Constants.ModifyTimer.gradentColor0, selection: $gradientColor0, supportsOpacity: false)
                        ColorPicker(Constants.ModifyTimer.gradentColor1, selection: $gradientColor1, supportsOpacity: false)
                        ColorPicker(Constants.ModifyTimer.gradentColor2, selection: $gradientColor2, supportsOpacity: false)
                    }
                }
                Section (header: Text(Constants.ModifyTimer.countdownLabel)) {
                    DatePicker(selection: $countdownDate, label: { Text(Constants.ModifyTimer.dateTimeLabel) })
                    
                }
            }
            Button {
                if emoji.isSingleEmoji {
                    saveButton()
                    isPresented = false
                } else {
                    showingAlert = true
                }
            } label: {
                Text(Constants.ModifyTimer.saveButton)
                    .frame(width: 375, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8))
                    .accentColor(Constants.appColor)
                
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(Constants.ModifyTimer.emojiErrorTitle), message: Text(Constants.ModifyTimer.emojiErrorMessage),             dismissButton: .destructive(Text(Constants.ModifyTimer.emojiErrorButton)))
            }
            .alert(isPresented: $missingValueAlert) {
                Alert(title: Text(Constants.ModifyTimer.emojiErrorTitle), message: Text(Constants.ModifyTimer.missingValueMessage),             dismissButton: .destructive(Text(Constants.ModifyTimer.emojiErrorButton)))
            }
        }.navigationTitle(navBarTitle)
    }
    
    func saveButton() {
        // Save changes
        //TODO: Make it so all feilds must be filled in. allso allow users to create gradient array.
        //TODO: sender makes view conditional.
        
        isPresented = false
        if name == Constants.emptyString || emoji == Constants.emptyString {
            // show alert that missing fields are required
            missingValueAlert.toggle()
        } else {
            let item = TimerObject(id: UUID(), name: name, emoji: emoji, color: color, gradient: [gradientColor0, gradientColor1, gradientColor2], date: countdownDate, gradientEnabled: gradientToggle)
            self.timer.items.append(item)
        }
    }
}

struct EditTimer_Previews: PreviewProvider {
    static var previews: some View {
        EditTimer(isModal: .constant(true), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))
        EditTimer(isModal: .constant(false), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))
            .preferredColorScheme(.dark)

    }
}
