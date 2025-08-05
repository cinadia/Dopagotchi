//
//  ItemView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-04-25.
//

import SwiftUI
import SwiftData
import Combine
import UIKit

struct ItemView<ItemType: PersistentModel>: View where ItemType: Identifiable {
    @Environment(Pet.self) var pet
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    @Query private var items: [ItemType] // TODO: items aren't shown in chronologically-added order
    
    var title: String
    var subtitle: String
    var imageName: String
    var createItem: (String) -> ItemType
    
    @State private var isAddingItem = false
    @State private var itemToAdd = ""
    @State private var editMode: EditMode = .inactive
    @State private var keyboardHeight: CGFloat = 0

    @FocusState private var isAddItemFocused: Bool
    
    var body: some View {
        NavigationView {
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
            .padding(.bottom, keyboardHeight)
            .onReceive(KeyboardPublisher.height) { self.keyboardHeight = $0 }
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
    
    var addingItemView: some View {
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
                Label("Add Item", image: colorScheme == .dark ? "PlusDark" : "PlusLight")
            }
        }
    }
}

