//
//  ListView.swift
//  TodoList
//
//  Created by Mauli Gulati on 21/7/25.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ListViewModel.self) var listViewModel
    @State private var editMode: EditMode = .inactive
    
    var body: some View {
        ZStack {
            List {
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
            .listStyle(.plain)
            
            // Overlay NoItemsView *above* the list, when empty
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(.opacity)
                    .animation(.easeIn, value: listViewModel.items.isEmpty)
            }
        }
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(editMode == .active ? "Done" : "Edit") {
                    withAnimation {
                        editMode = (editMode == .active) ? .inactive : .active
                    }
                }
                .disabled(listViewModel.items.isEmpty)
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
        .onChange(of: listViewModel.items.count) {
            if listViewModel.items.isEmpty {
                editMode = .inactive
            }
        }
        .environment(\.editMode, $editMode) // connects the list to the custom edit mode
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environment(ListViewModel())
}
