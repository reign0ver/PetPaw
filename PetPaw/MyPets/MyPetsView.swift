//
//  MyPetsView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 1/04/24.
//

import SwiftUI

struct MyPetsView: View {
    @State var pets: [Pet] = [
        Pet(name: "Martina", breed: .cat),
        Pet(name: "Luchito", breed: .cat),
        Pet(name: "Chispita", breed: .cat),
        Pet(name: "Adam", breed: .cat),
        Pet(name: "Lalo (el de Socorro)", breed: .dog),
        Pet(name: "Lalo (el de Socorro)", breed: .dog),
        Pet(name: "Lalo (el de Socorro)", breed: .dog)
    ]
    
    var layout: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 140), spacing: 36)
    ]
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: layout, spacing: 36) {
                    ForEach(pets) { pet in
                        PetCardView(pet: pet, cardSize: nil)
                            .onTapGesture {
                                // TODOSITO
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("My Pets")
            .sheet(isPresented: $isPresented, content: {
                AddKindOfPetView(isPresented: $isPresented)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: { isPresented = true },
                        label: { Image(systemName: "plus") }
                    )
                }
            }
        }
    }
}

struct Pet: Identifiable {
    let id = UUID()
    let name: String
    let breed: Breed
}

#Preview {
    MyPetsView()
}
