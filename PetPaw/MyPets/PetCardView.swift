//
//  PetCardView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 3/04/24.
//

import SwiftUI

struct PetCardView: View {
    let pet: Pet
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image("turtlerock")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                
                Text(pet.kind.emoji)
                    .font(.title)
                    .padding(6)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 6)
            }
            
            Text(pet.name)
                .lineLimit(...1)
        }
    }
}
#if DEBUG
#Preview {
    PetCardView(
        pet: Pet(
            name: "Martina",
            kind: .cat,
            weight: 4.5,
            age: 8,
            profile: PetProfileInfo(
                bio: "Hola! Soy Martina, la gata más bonita de mi casita. Mi papá adoptivo diría que es Lusho, pero es mentira, yo soy, Lusho es feo y cansón 😉"
            )
        )
    )
}
#endif
