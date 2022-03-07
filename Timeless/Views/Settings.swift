//
//  Settings.swift
//  Timeless
//
//  Created by Joe Speakman on 3/7/22.
//
// This should be the way to get to adding share text and other configuration options.

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            List {
                Section{
                    NavigationLink("Edit Share Text", destination: ShareTextView())
                    NavigationLink("Create Countdown", destination: EditTimer(timer: FirstTimer(), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer)))
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
