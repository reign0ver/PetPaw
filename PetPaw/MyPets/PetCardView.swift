//
//  PetCardView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 3/04/24.
//

import SwiftUI

struct PetCardView: View {
    let pet: Pet
    let cardSize: CGSize?
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                CircleImage(
                    image: Image("turtlerock"), 
                    size: cardSize
                )
                
                Text(pet.breed.emoji)
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
    PetCardView(pet: Pet(name: "Luchito", breed: .cat), cardSize: nil)
}
#endif
