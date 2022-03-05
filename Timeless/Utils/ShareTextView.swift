//
//  ShareTextView.swift
//  Timeless
//
//  Created by Joe Speakman on 2/18/22.
//

import SwiftUI

struct ShareTextView: View {
    
    @State private var shareTextInput =  ""
    @ObservedObject var sharedText = SharedText()
    
    var body: some View {
        NavigationView {
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
            .toolbar {
                Button {
                    addItem()
                    
                } label: {
                    Constants.Images.plus
                }
                
            }
        }
    }

    private func addItem() {
//    let newItem = ShareText(context: viewContext)
//    newItem.msg = shareTextInput
//
//    do {
//        try viewContext.save()
//
//    } catch {
//        let nsError = error as NSError
//        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//    }
}
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            sharedText.items.remove(atOffsets: offsets)
        }
    }
}

struct ShareTextView_Previews: PreviewProvider {
    static var previews: some View {
        ShareTextView().environment(\.managedObjectContext, ShareTextPersistenceController.preview.container.viewContext)
    }
}
