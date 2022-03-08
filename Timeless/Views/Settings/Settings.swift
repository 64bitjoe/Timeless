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
                    NavigationLink(destination: ShareTextView()) {
                        Image(systemName: "text.bubble")
                            .foregroundColor(.indigo)
                        Text(Constants.Settings.editLabel)
                    }
                    NavigationLink(destination: EditTimer(timer: FirstTimer(), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))){
                        Image(systemName: "pencil.circle.fill")
                            .foregroundColor(.indigo)
                        Text(Constants.Settings.createLabel)
                    }
                }
                Section{
                    NavigationLink(destination: About()){
                        Image(systemName: "person.circle.fill")
                            .foregroundColor(.indigo)
                        Text(Constants.Settings.aboutLabel)
                    }
                    
                }
            }
            .navigationTitle(Constants.Settings.navTitle)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
