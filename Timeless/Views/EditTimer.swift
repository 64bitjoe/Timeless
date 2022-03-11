//
//  EditTimer.swift
//  Timeless
//
//  Created by Joe Speakman on 5/10/21.
//

import SwiftUI

struct EditTimer: View {
    @ObservedObject var timer: FirstTimer
    @Binding var isModal: Bool
    @Binding var isPresented: Bool
    @Binding var navBarTitle: String
    var body: some View {
        
        VStack {
            if isModal {
                NavigationView {
                    EditTimerBody(timer: FirstTimer(), isPresented: $isPresented, navBarTitle: $navBarTitle)
                }
            } else {
                EmptyView()
                EditTimerBody(timer: FirstTimer(), isPresented: $isPresented, navBarTitle: $navBarTitle)
            }
        }

    }
}
struct EditTimerBody: View {
    @ObservedObject var timer: FirstTimer
    @Binding var isPresented: Bool
    @Binding var navBarTitle: String
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var gradentToggle = false
    @State private var pickerValue = 0
    @State private var name = Constants.emptyString
    @State private var emoji = Constants.emptyString
    @State private var color = Color.gray
    @State private var countdownDate = Date()
    
    
    var body: some View {
        VStack {
            Form {
                Section (header: Text(Constants.ModifyTimer.firstSectionHeader)) {
                    TextField(Constants.ModifyTimer.coutndownTextFeild, text: $timer.name)
                        .font(.title2.weight(.semibold))
                    TextField(Constants.ModifyTimer.emojiTextFeild, text: $emoji)
                    
                    ColorPicker(Constants.ModifyTimer.colorLabel, selection: $color, supportsOpacity: false)
                    
                    Toggle(Constants.ModifyTimer.gradientLabel, isOn: $gradentToggle)
                    
                }
                Section (header: Text(Constants.ModifyTimer.countdownLabel)) {
                    DatePicker(selection: $countdownDate, label: { Text(Constants.ModifyTimer.dateTimeLabel) })
                    
                }
            }
            Button {
                if emoji.isSingleEmoji {
                    isPresented = false
                } else {
                    showingAlert = true
                }
            } label: {
                Text(Constants.ModifyTimer.saveButton)
                    .frame(width: 375, height: 50, alignment: .center)
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 8))
                    .accentColor(.indigo)
                
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(Constants.ModifyTimer.emojiErrorTitle), message: Text(Constants.ModifyTimer.emojiErrorMessage),             dismissButton: .destructive(Text(Constants.ModifyTimer.emojiErrorButton)))
            }
        }.navigationTitle(navBarTitle)
    }
    
    func saveButton() {
        // Save changes
        //TODO: Make it so all feilds must be filled in. allso allow users to create gradient array.
        //TODO: sender makes view conditional.
        isPresented = false
    }
}

struct EditTimer_Previews: PreviewProvider {
    static var previews: some View {
        EditTimer(timer: FirstTimer(), isModal: .constant(true), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))
        EditTimer(timer: FirstTimer(), isModal: .constant(false), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))
            .preferredColorScheme(.dark)

    }
}
