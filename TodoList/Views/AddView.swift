//
//  AddView.swift
//  TodoList
//
//  Created by Mauli Gulati on 21/7/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(ListViewModel.self) var listViewModel
    @State private var textFieldText: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter your task here...", text: $textFieldText)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .frame(height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(uiColor: .secondarySystemBackground))
                    )
                
                Button {
                    saveItem()
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
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveItem() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your task must be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}

#Preview("Add View – Light Mode") {
    NavigationStack {
        AddView()
    }
    .environment(ListViewModel())
    .preferredColorScheme(.light)
}

#Preview("Add View – Dark Mode") {
    NavigationStack {
        AddView()
    }
    .environment(ListViewModel())
    .preferredColorScheme(.dark)
}
