//
//  Settings.swift
//  Timeless
//
//  Created by Joe Speakman on 5/10/21.
//

import SwiftUI

struct Settings: View {
    @ObservedObject var timer: FirstTimer
    @State private var pickerValue = 0
    @State private var name = ""
    @State private var emoji = ""
    @State private var countdownDate = Date()
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $pickerValue, label: Text("What is your favorite color?")) {
                    Text("Timer 1").tag(0)
                    Text("Timer 2").tag(1)
                }
                .padding(.horizontal)
                .pickerStyle(SegmentedPickerStyle())
                VStack {
                    Form {
                        Section (header: Text("Name")) {
                            TextField("Vacation!", text: $timer.name)
                                .font(.title)
                            
                            TextField("🏝", text: $timer.emoji)
                                .font(.title)
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
    }
}
func saveButton() {

}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(timer: FirstTimer())
        Settings(timer: FirstTimer())
            .preferredColorScheme(.dark)

    }
}
