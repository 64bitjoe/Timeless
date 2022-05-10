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
        ZStack {
            GroupBox() {
                LazyVStack {
                    Text(constants.startText)
                        .padding(.bottom)
                        .foregroundStyle(Constants.Gradients.seccondGradient)
                        .font(.largeTitle.bold())
                    Text(constants.createText)
                        .font(.subheadline)
                }
                
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Constants.appColor, lineWidth: 1)
            )
            .padding()
            .onTapGesture {
                isPresented.toggle()
        }
        }            .background(.background)
    }
}

struct AddShareText_Previews: PreviewProvider {
    static var previews: some View {
        AddShareText(isPresented: .constant(true))

    }
}
