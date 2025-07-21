//
//  AddView.swift
//  TodoList
//
//  Created by Mauli Gulati on 21/7/25.
//

import SwiftUI

struct AddView: View {
    
    @State private var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter your task here...", text: $textFieldText)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                    )
                
                Button {
                    //TODO: Save action
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.accentColor)
                        )
                }
                .disabled(textFieldText.isEmpty)
            }
            .padding(14)
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("Add an item 🖊️")
    }
}

#Preview {
    NavigationStack {
        AddView()
    }
}
