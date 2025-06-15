//
//  ItemView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-04-25.
//

import SwiftUI
import SwiftData

struct ItemView<ItemType: PersistentModel>: View where ItemType: Identifiable {
    @Environment(Pet.self) var pet
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var items: [ItemType]
    
    var title: String
    var subtitle: String
    var imageName: String
    var createItem: (String) -> ItemType
    
    @State private var isAddingItem = false
    @State private var itemToAdd = ""
    @State private var editMode: EditMode = .inactive

    @FocusState private var isAddItemFocused: Bool
    
    var body: some View {
        NavigationStack {
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
        .environment(\.editMode, $editMode)
        .scrollContentBackground(.hidden)
    }
    
    var addingItemView: some View { // TODO: lots of warnings + keyboard isnt right
        Form {
            Section(header: Text("Item to Add")) {
                HStack {
                    TextField("New item", text: $itemToAdd)
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
    
    private var editButton: some View {
        return Button {
            if editMode == .inactive {
                editMode = .active
            } else {
                editMode = .inactive
            }
        } label: {
            Text(editMode == .inactive ? "Edit" : "Done").customFont().foregroundStyle(.button)
        }
    }

}

extension ItemView {
    @ToolbarContentBuilder
    func toolbarContent() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            editButton
        }
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: {
                dismiss()
            }) {
                Text("Dismiss").customFont().foregroundStyle(.button)
            }
        }
        ToolbarItem {
            Button(action: {
                isAddingItem.toggle()
                isAddItemFocused.toggle()
                itemToAdd = ""
            }) {
                Label("Add Item", systemImage: "plus") // TODO: change this colour, prob by creating our own + or something
            }
        }
    }
}

