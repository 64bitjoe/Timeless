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
    @State private var color = Color.white
    @State private var countdownDate = Date()
    var body: some View {
        NavigationView {
                VStack {
                    Form {
                        Section (header: Text("Name")) {
                                TextField("Vacation!", text: $timer.name)
                                .font(.title2)
                                TextField("🏝", text: $timer.emoji)
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
        isPresented = false
    }

}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        EditTimer(timer: FirstTimer(), isPresented: .constant(true))
        EditTimer(timer: FirstTimer(), isPresented: .constant(true))
            .preferredColorScheme(.dark)

    }
}
