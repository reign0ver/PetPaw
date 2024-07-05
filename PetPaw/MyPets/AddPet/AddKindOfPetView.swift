//
//  AddKindOfPetView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI

// TODO: Move this
enum Breed {
    case dog
    case cat
    case other
    
    var name: String {
        switch self {
        case .dog: "Dog"
        case .cat: "Cat"
        case .other: "Other"
        }
    }
    
    var emoji: String {
        switch self {
        case .cat: "🐱"
        case .dog: "🐶"
        case .other: "🐾"
        }
    }
}

extension Breed: CaseIterable {}

extension Breed: Identifiable {
    var id: Self { self }
}

struct AddKindOfPetView: View {
    
    private var breeds = Breed.allCases
    
    @State private var selectedBreed = Breed.other
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
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
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    cancelButton
                }
            }
        }
    }
    
    private var nextButton: some View {
        NavigationLink(
            destination: AddPetProfileView(),
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
    AddKindOfPetView(isPresented: .constant(true))
}
#endif
