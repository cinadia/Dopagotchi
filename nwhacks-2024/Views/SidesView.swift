//
//  SidesView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct SidesView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var items: [SideItem]
    @State private var isAddingItem = false
    @State private var itemToAdd = ""
    @FocusState private var isAddItemFocused: Bool
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("sides").customTitleFont()
                Spacer()
                Text("activities that you can add to other activities to make it more enjoyable")
                    .customFont()
                    .multilineTextAlignment(.center)
                Image("side")
                listOfSides
                    .toolbar(content: self.toolbarContent)
                
                if isAddingItem {
                    addingItem
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Color("BackgroundColor"))
        } detail: {
            Text("Select an item")
        }
    }
    
    var listOfSides: some View {
        List {
            ForEach(items) { item in
                Grid {
                    GridRow {
                        FeedButton()
                            .frame(maxHeight: 20)
                            .buttonStyle(FeedButtonStyle())
                        Text(item.desc)
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }.scrollContentBackground(.hidden)
    }
    
    var addingItem: some View {
        Form {
            Section(header: Text("Item to Add")) {
                HStack {
                    TextField("Key in value", text: $itemToAdd)
                        .keyboardType(.default)
                        .focused($isAddItemFocused)
                    
                    Button(action: {
                        addItem()
                        isAddingItem = false
                        itemToAdd = ""
                    }) {
                        Text("Done")
                    }
                }
            }
        }
        .frame(height: 100)
    }
    
    private func addItem() {
        withAnimation {
            if (itemToAdd != "") {
                let newItem = SideItem(description: itemToAdd)
                modelContext.insert(newItem)
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

extension SidesView {
    @ToolbarContentBuilder
        func toolbarContent() -> some ToolbarContent {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Dismiss") {
                    dismiss()
                }
            }
            ToolbarItem {
                Button(action: {
                    isAddingItem.toggle()
                    isAddItemFocused.toggle()
                    itemToAdd = ""
                }) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
}

#Preview {
    SidesView()
        .modelContainer(for: SideItem.self, inMemory: true)
}
