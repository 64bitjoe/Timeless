//
//  ShareTextView.swift
//  Timeless
//
//  Created by Joe Speakman on 2/18/22.
//

import SwiftUI
import CoreData

struct ShareTextView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \ShareText.msg, ascending: true)], animation: .default)
    
    private var items: FetchedResults<ShareText>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) {item in
                    Text(item.msg!)
                    
                }
                .onDelete(perform: deleteItems)
                
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
    let newItem = ShareText(context: viewContext)
    newItem.msg = "Test"
    
    do {
        try viewContext.save()
        
    } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
}
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ShareTextView_Previews: PreviewProvider {
    static var previews: some View {
        ShareTextView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
