//
//  MyPetsView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 1/04/24.
//

import SwiftUI

struct MyPetsView: View {
    @State var pets: [Pet] = [
        Pet(name: "Martina", kind: .cat),
        Pet(name: "Luchito", kind: .cat),
        Pet(name: "Chispita", kind: .cat),
        Pet(name: "Adam", kind: .cat),
        Pet(name: "Lalo (el de Socorro)", kind: .dog),
        Pet(name: "Lalo (el de Socorro)", kind: .dog),
        Pet(name: "Lalo (el de Socorro)", kind: .dog)
    ]
    
    var layout: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 140), spacing: 36)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: layout, spacing: 36) {
                    ForEach(pets) { pet in
                        PetCardView(pet: pet)
                    }
                }
                .padding()
            }
            .navigationTitle("My Pets")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        AddKindOfPetView()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct Pet: Identifiable {
    let id = UUID()
    let name: String
    let kind: PetKind
    
    var emoji: String {
        switch kind {
        case .cat:
            "🐱"
        case .dog:
            "🐶"
        }
    }
}

enum PetKind {
    case cat, dog
}

#Preview {
    MyPetsView()
}
