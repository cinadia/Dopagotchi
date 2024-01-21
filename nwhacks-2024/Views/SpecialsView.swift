//
//  SpecialsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct SpecialsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Query private var items: [SpecialItem]
    @State private var isAddingItem = false
    @State private var itemToAdd = ""
    @FocusState private var isAddItemFocused: Bool
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("specials").customTitleFont()
                Spacer()
                Text("activities that are expensive or less convenient")
                    .customFont()
                    .multilineTextAlignment(.center)
                Image("specials")
                listOfSpecials
                    .toolbar(content: self.toolbarContent)
                if isAddingItem {
                    addingItem
                }
            }
            .background(Color("BackgroundColor"))
        } detail: {
            Text("Select an item")
        }
    }
    
    var listOfSpecials: some View {
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
                let newItem = SpecialItem(description: itemToAdd)
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

extension SpecialsView {
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
    SpecialsView()
        .modelContainer(for: SpecialItem.self, inMemory: true)
}
