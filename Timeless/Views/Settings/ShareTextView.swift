//
//  ShareTextView.swift
//  Timeless
//
//  Created by Joe Speakman on 2/18/22.
//

import SwiftUI

struct ShareTextView: View {
    
    @State private var shareTextInput =  Constants.emptyString
    @State private var getStartedModal = true
    
    @ObservedObject var sharedText = SharedText()
    
    var body: some View {
            VStack {
//                if getStartedModal == true {
//                    AddShareText(isPresented: $getStartedModal)
//                } else {
//                    EmptyView()
//                }
                List {
                    ForEach(sharedText.items) {item in
                        Text(item.message)
                        
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                
                HStack {
                    Image(systemName: "plus")
                    TextField(
                        Constants.AddText.textFieldPlaceholder,
                        text: $shareTextInput
                    )

                        .onSubmit {
                        addItem()
                            self.shareTextInput = Constants.emptyString
                        }
                }.underlineTextField()
                .padding([ .leading, .trailing], 10)
            .padding(.bottom, 5)
            }
            .navigationBarTitle(Text(Constants.AddText.navTitle))
            .onAppear(perform: {
                LaunchUtil.firstLaunch()
                
            })
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
