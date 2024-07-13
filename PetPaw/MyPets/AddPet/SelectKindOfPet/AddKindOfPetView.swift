//
//  AddKindOfPetView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI

struct AddKindOfPetView: View {
    
    @State private var selectedBreed: PetKind?
    // TODOSITO: Naming
    @Binding private var isPresented: Bool
    @ObservedObject private var appState: AppState
    
    private var breeds = PetKind.allCases
    
    init(
        isPresented: Binding<Bool>,
        appState: AppState
    ) {
        _isPresented = isPresented
        self.appState = appState
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("What kind of pet do you have?")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                }
                .listRowBackground(Color.clear)
                
                ForEach(breeds, id: \.self) { breed in
                    HStack {
                        Label(
                            title: { Text(breed.name) },
                            icon: { Text(breed.emoji) }
                        )
                        Spacer()
                        if selectedBreed == breed {
                            // Would be a good idea to have an enum to initialize SF Symbols
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        guard selectedBreed != breed else { return }
                        selectedBreed = breed
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add new pet")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    nextButton
                        .disabled(selectedBreed == nil)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    cancelButton
                }
            }
        }
    }
    
    private var nextButton: some View {
        NavigationLink(
            destination: AddPetProfileView(isPresented: $isPresented, appState: appState),
            label: { Text("Next").bold() }
        )
    }
    
    private var cancelButton: some View {
        Button(
            action: { isPresented = false },
            label: { Text("Cancel") }
        )
    }
}

#if DEBUG
#Preview {
    AddKindOfPetView(isPresented: .constant(true), appState: AppState())
}
#endif
