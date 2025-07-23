//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mauli Gulati on 23/7/25.
//

import SwiftUI

@Observable
class ListViewModel {
    
    var items: [Item] = []
    
    init() {
        getItems()
    }
    
    //CRUD Functions - Create(add), Read(get), Update, Delete
    
    func addItem(title: String) {
        items.append(Item(title: title, isCompleted: false))
    }
    
    func getItems() {
        let newItems: [Item] = [
            Item(title: "First Item!", isCompleted: false),
            Item(title: "Second Item!", isCompleted: true),
            Item(title: "Third Item!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func updateItem(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func deleteItem(indexSet:  IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}
