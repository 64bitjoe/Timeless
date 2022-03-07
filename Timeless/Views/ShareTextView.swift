//
//  ShareTextView.swift
//  Timeless
//
//  Created by Joe Speakman on 2/18/22.
//

import SwiftUI

struct ShareTextView: View {
    
    @State private var shareTextInput =  ""
    @State private var getStartedModal = true
    
    @ObservedObject var sharedText = SharedText()
    
    var body: some View {
            VStack {
                List {
                    ForEach(sharedText.items) {item in
                        Text(item.message)
                        
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                TextField(
                    "Share Message",
                    text: $shareTextInput
                )
                    .textFieldStyle(.roundedBorder)

                    .onSubmit {
                    addItem()
                }
                    .padding([.leading, .trailing], 10)
                    .padding(.bottom, 5)
            }
            .navigationBarTitle(Text("Customize Share Text"))

            .sheet(isPresented: $getStartedModal) {
                AddShareText(isPresented: $getStartedModal)
            }
    }

    private func addItem() {
        if shareTextInput.isEmpty {
            //TODO: Send Alert to tell user to input text before saving
            
        } else {
            let item = ShareTextObject(message: shareTextInput)
            self.sharedText.items.append(item)
            
        }
}
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            sharedText.items.remove(atOffsets: offsets)
        }
    }
}

struct ShareTextView_Previews: PreviewProvider {
    static var previews: some View {
        ShareTextView()
    }
}