//
//  About.swift
//  Timeless
//
//  Created by Joe Speakman on 3/8/22.
//

import SwiftUI

struct About: View {
    var body: some View {
//        GroupBox {
            Section{
                VStack{
                    Text("Hi, My name is Joe. and I'm a Software Engineer")
                        .font(.title)
                    Image("JoeIRL")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            Text("Timeless has been my project to push myself to learn new skills. This project started before I did the 100 Days of SwiftUI.")
            }
//    }
        .navigationBarTitle(Text(Constants.About.navTitle))
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
