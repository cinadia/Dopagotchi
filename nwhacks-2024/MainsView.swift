//
//  Mains.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct MainsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [TaskItem]
    @State private var isAddingItem = false
    @State private var itemToAdd = ""
    @FocusState private var isAddItemFocused: Bool
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationSplitView {
            VStack {
                List {
                    ForEach(items) { item in
                        Text(item.desc)
                    }
                    .onDelete(perform: deleteItems)
                }
                .toolbar(content: self.toolbarContent)
                
                if isAddingItem {
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
            }
            .navigationTitle("Mains")
            
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            if (itemToAdd != "") {
                let newItem = TaskItem(description: itemToAdd)
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

extension MainsView {
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
                }) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
}
#Preview {
    MainsView()
        .modelContainer(for: TaskItem.self, inMemory: true)
}
