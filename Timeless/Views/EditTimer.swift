//
//  EditTimer.swift
//  Timeless
//
//  Created by Joe Speakman on 5/10/21.
//

import SwiftUI

struct EditTimer: View {
    @ObservedObject var timer: FirstTimer
    @Binding var isPresented: Bool
    @Binding var navBarTitle: String
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var gradentToggle = false
    @State private var pickerValue = 0
    @State private var name = ""
    @State private var emoji = ""
    @State private var color = Color.gray
    @State private var countdownDate = Date()
    var body: some View {
//        NavigationView {
                VStack {
                    Form {
                        Section (header: Text(Constants.ModifyTimer.firstSectionHeader)) {
                            TextField(Constants.ModifyTimer.coutndownTextFeild, text: $timer.name)
                                .font(.title2.weight(.semibold))
                            TextField(Constants.ModifyTimer.emojiTextFeild, text: $emoji)
//                                    .font(.title)
                            
                            ColorPicker(Constants.ModifyTimer.colorLabel, selection: $color, supportsOpacity: false)
                            
                            Toggle("Gradient", isOn: $gradentToggle)
                       
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
//        }
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
        EditTimer(timer: FirstTimer(), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))
        EditTimer(timer: FirstTimer(), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))
            .preferredColorScheme(.dark)

    }
}
