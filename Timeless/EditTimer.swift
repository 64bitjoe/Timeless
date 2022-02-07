//
//  EditTimer.swift
//  Timeless
//
//  Created by Joe Speakman on 5/10/21.
//

import SwiftUI

struct EditTimer: View {
    @ObservedObject var timer: FirstTimer
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    @State private var pickerValue = 0
    @State private var name = ""
    @State private var emoji = ""
    @State private var countdownDate = Date()
    var body: some View {
        NavigationView {
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
                        showingSheet.toggle()
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
        dismiss()
    }

}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        EditTimer(timer: FirstTimer())
        EditTimer(timer: FirstTimer())
            .preferredColorScheme(.dark)

    }
}
