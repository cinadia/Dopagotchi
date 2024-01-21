//
//  AppsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct AppsView: View {
    @EnvironmentObject var pet: Pet
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var items: [AppItem]
    @State private var isAddingItem = false
    @State private var itemToAdd = ""
    @FocusState private var isAddItemFocused: Bool
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("starters").customTitleFont()
                Spacer()
                Text("activites that are quick and don't suck you in")
                    .customFont()
                    .multilineTextAlignment(.center)
                Image("app")
                listOfApps
                    .toolbar(content: self.toolbarContent)
                
                if isAddingItem {
                    addingItem
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(pet.backgroundColor)
        } detail: {
            Text("Select an item")
        }
    }
    
    var listOfApps: some View {
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
                let newItem = AppItem(description: itemToAdd)
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

extension AppsView {
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
    AppsView()
        .modelContainer(for: AppItem.self, inMemory: true)
}
