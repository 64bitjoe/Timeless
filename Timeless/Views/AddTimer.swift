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
                    .foregroundStyle(Constants.Gradients.gradient)
                    .font(.largeTitle.bold())
                Text(constants.createText)
                    .font(.subheadline)
                    .padding(.bottom)
                Image(systemName: "plus.square.fill")
                    .foregroundColor(Color.gray)
                    .font(.largeTitle.bold())
            }
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.indigo, lineWidth: 1)
        )
        .padding()
    }

}

struct AddTimer_Previews: PreviewProvider {
    static var previews: some View {
        AddTimer()
    }
}
