//
//  ListView.swift
//  TodoList
//
//  Created by Mauli Gulati on 21/7/25.
//

import SwiftUI

struct ListView: View {
    
    @State private var items: [Item] = [
        Item(title: "First Item!", isCompleted: false),
        Item(title: "Second Item!", isCompleted: true),
        Item(title: "Third Item!", isCompleted: false)
    ]
    
    @State private var editMode: EditMode = .inactive

    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(editMode == .active ? "Done" : "Edit") {
                    withAnimation {
                        editMode = (editMode == .active) ? .inactive : .active
                    }
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
        .environment(\.editMode, $editMode) // ✅ this connects the list to the custom edit mode

    }
    
    func deleteItem(indexSet:  IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
