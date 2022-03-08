//
//  AddShareText.swift
//  Timeless
//
//  Created by Joe Speakman on 3/6/22.
//

import SwiftUI

struct AddShareText: View {
    @State var tapped = false
    @Binding var isPresented: Bool
    let constants = Constants.AddText.self
    var body: some View {
        GroupBox() {
            LazyVStack {
                Text(constants.startText)
                    .foregroundStyle(Constants.Gradients.seccondGradient)
                    .font(.largeTitle.bold())
                Text(constants.createText)
                    .font(.subheadline)
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
        .onTapGesture {
            isPresented.toggle()
        }
    }
}

struct AddShareText_Previews: PreviewProvider {
    static var previews: some View {
        AddShareText(isPresented: .constant(true))

    }
}
