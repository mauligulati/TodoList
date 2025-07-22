//
//  ListRowView.swift
//  TodoList
//
//  Created by Mauli Gulati on 21/7/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: Item
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        ListRowView(item: Item(title: "First Item!", isCompleted: false))
        ListRowView(item: Item(title: "Second Item!", isCompleted: true))
    }
}
