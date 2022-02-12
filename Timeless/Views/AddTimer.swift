//
//  AddTimer.swift
//  Timeless
//
//  Created by Joe Speakman on 2/10/22.
//

import SwiftUI

struct AddTimer: View {
    var body: some View {
        GroupBox() {
            LazyVStack {
                Text("Get Started")
//                    .foregroundStyle(gradient)
                    .font(.largeTitle.bold())
                Text("Create First timer")
                    .font(.subheadline)
                    .padding(.bottom)
                Button {
                    //Will present the new timer scren
                    
                } label: {
                    Image(systemName: "plus.square.fill")
                        .font(.largeTitle.bold())
                }
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
