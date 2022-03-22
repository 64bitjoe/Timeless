//
//  Settings.swift
//  Timeless
//
//  Created by Joe Speakman on 3/7/22.
//
//

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
                    NavigationLink(destination: EditTimer(isModal: .constant(false), isPresented: .constant(true), navBarTitle: .constant(Constants.ModifyTimer.createTimer))){
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
