//
//  Item.swift
//  TodoList
//
//  Created by Mauli Gulati on 21/7/25.
//

import Foundation

struct Item: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
