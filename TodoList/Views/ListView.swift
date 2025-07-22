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
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Edit") {
                    
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
