//
//  ListView.swift
//  TodoList
//
//  Created by Mauli Gulati on 21/7/25.
//

import SwiftUI

struct ListView: View {
    
    @State var items = [
        "First Item!",
        "Second Item",
        "Third Item"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Edit") {
                    
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: Text("Destination"))
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
