//
//  ItemViewModel.swift
//  Dopagotchi
//
//  Created by Cindy Cui on 2025-08-18.
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
class ItemViewModel<ItemType: PersistentModel>: ObservableObject where ItemType: Identifiable {
    let context: ModelContext
    var items: [ItemType] = [] // TODO: items aren't shown in chronologically-added order
    @Published var isAddingItem = false
    
    private let createItem: (String) -> ItemType
    
    init(context: ModelContext, createItem: @escaping (String) -> ItemType) {
        self.context = context
        self.createItem = createItem
        
        fetchData()
    }
    
    private func fetchData() {
        do {
            let itemsDescriptor = FetchDescriptor<ItemType>()
            
            self.items = try context.fetch(itemsDescriptor)
        } catch {
            print("Failed to fetch data: \(error)")
        }
    }
    
    func addItem(item: String) {
        let newItem = createItem(item)
        context.insert(newItem)
        
        try? context.save()
        
        fetchData()
    }
    
    func deleteItems(at offsets: IndexSet) {
        for index in offsets {
            context.delete(items[index])
        }
        try? context.save()
    }
    
}
