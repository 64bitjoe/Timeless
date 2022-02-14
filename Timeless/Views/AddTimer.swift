//
//  AddTimer.swift
//  Timeless
//
//  Created by Joe Speakman on 2/10/22.
//

import SwiftUI

struct AddTimer: View {
    @State var tapped = false
    let constants = Constants.AddTimer.self
    var body: some View {
        GroupBox() {
            LazyVStack {
                Text(constants.startText)
//                    .foregroundStyle(Constants.Gradient.gradient)
                    .font(.largeTitle.bold())
                Text(constants.createText)
                    .font(.subheadline)
                    .padding(.bottom)
                Image(systemName: "plus.square.fill")
                    .font(.largeTitle.bold())
            }
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
    }

}

struct AddTimer_Previews: PreviewProvider {
    static var previews: some View {
        AddTimer()
    }
}
