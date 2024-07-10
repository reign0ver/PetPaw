//
//  MyPetsListView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 1/04/24.
//

import SwiftUI

struct MyPetsListView: View {
    @State private var pets: [Pet] = [
        Pet(
            name: "Martina",
            kind: .cat,
            weight: 4.5,
            age: 8,
            profile: PetProfileInfo(
                bio: "Hola! Soy Martina, la gata más bonita de mi casita. Mi papá adoptivo diría que es Lusho, pero es mentira, yo soy, Lusho es feo y cansón 😉"
            )
        ),
        Pet(
            name: "Chispita",
            kind: .cat,
            weight: 4.5,
            age: 9,
            profile: PetProfileInfo(
                bio: "Hola! Soy Chispita, una gatita albina de 9 años. Soy un poco nerviosa pero muy amorosa, hace poquito me dejaron sin dientes pero me veo muy linda muequita❤️"
            )
        ),
        Pet(
            name: "Mili",
            kind: .cat,
            weight: 4.5,
            age: 10,
            profile: PetProfileInfo(
                bio: "Hola! Soy Mili, tengo 10 añitos, soy una gata muy peluda, digo que soy angora pero no sé si lo soy😜. Soy muy interesada, solo doy amor a cambio de Churu😾"
            )
        )
    ]
    
    private var layout: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 140), spacing: 36)
    ]
    
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: layout, spacing: 36) {
                    ForEach(pets) { pet in
                        NavigationLink(
                            destination: { PetProfileView(pet: pet) },
                            label: { PetCardView(pet: pet, cardSize: nil) }
                        )
                        .buttonStyle(PlainButtonStyle())
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

#Preview {
    MyPetsListView()
}
