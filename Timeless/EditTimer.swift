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
    @State private var showingSheet = false
    @State private var pickerValue = 0
    @State private var name = ""
    @State private var emoji = ""
    @State private var color = Color.gray
    @State private var countdownDate = Date()
    var body: some View {
        NavigationView {
                VStack {
                    Form {
                        Section (header: Text("Name")) {
                                TextField("Vacation!", text: $timer.name)
                                .font(.title2.weight(.semibold))
                                TextField("🏝", text: $emoji)
                                    .font(.title)
                            
                            ColorPicker("Set Timer border color", selection: $color, supportsOpacity: false)
                        }
                        Section (header: Text("Countdown to:")) {
                            DatePicker(selection: $countdownDate, label: { Text("Date & Time") })
                          
                        }
                    }
                    Button {
                        saveButton()
                    } label: {
                        Text("Save")
                            .frame(width: 375, height: 50, alignment: .center)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 8))
                            .accentColor(.indigo)
                           
                    }
                }.navigationTitle("Configure Countdown")
        }
    }
    func saveButton() {
        // Save changes
        //TODO: Make it so all feilds must be filled in. allso allow users to create gradient array.
        //TODO: sender makes view conditional.
        isPresented = false
        emojiCheck()
    }
    func emojiCheck() {
        if emoji.count == 1 {
            print("Passing the req")
        } else if emoji.count == 0 {
            print("No value was passed")
        }
        else {
            print("Display UI Alert that only one emoji can be set")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        EditTimer(timer: FirstTimer(), isPresented: .constant(true))
        EditTimer(timer: FirstTimer(), isPresented: .constant(true))
            .preferredColorScheme(.dark)

    }
}
