//
//  ItemView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-04-25.
//

import SwiftUI
import SwiftData

struct ItemView<ItemType: PersistentModel>: View where ItemType: Identifiable {
    @EnvironmentObject var pet: Pet
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var items: [ItemType]
    
    var title: String
    var subtitle: String
    var imageName: String
    var createItem: (String) -> ItemType
    
    @State private var isAddingItem = false
    @State private var itemToAdd = ""
    @FocusState private var isAddItemFocused: Bool
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text(title).customTitleFont()
                Spacer()
                Text(subtitle)
                    .customFont()
                    .multilineTextAlignment(.center)
                Image(imageName)
                listView
                    .toolbar(content: toolbarContent)
                
                if isAddingItem {
                    addingItemView
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(pet.backgroundColor)
        } detail: {
            Text("Select an item")
        }
    }
    
    var listView: some View {
        List {
            ForEach(items) { item in
                Grid {
                    GridRow {
                        FeedButton()
                            .frame(maxHeight: 40)
                            .buttonStyle(FeedButtonStyle())
                        Text((item as? DescribableItem)?.desc ?? "Unknown")
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
        .scrollContentBackground(.hidden)
    }
    
    var addingItemView: some View { // TODO: lots of warnings + keyboard isnt right
        Form {
            Section(header: Text("Item to Add")) {
                HStack {
                    TextField("Key in value", text: $itemToAdd)
                        .keyboardType(.default)
                        .focused($isAddItemFocused)
                    
                    Button("Done") {
                        addItem()
                        isAddingItem = false
                        itemToAdd = ""
                    }
                }
            }
        }
        .frame(height: 100)
    }
    
    private func addItem() {
        withAnimation {
            if !itemToAdd.isEmpty {
                let newItem = createItem(itemToAdd)
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

extension ItemView {
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
