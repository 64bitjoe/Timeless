//
//  About.swift
//  Timeless
//
//  Created by Joe Speakman on 3/8/22.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.navigationBarTitle(Text(Constants.About.navTitle))
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
