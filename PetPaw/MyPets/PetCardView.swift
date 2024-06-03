//
//  PetCardView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 3/04/24.
//

import SwiftUI

struct PetCardView: View {
    var pet: Pet
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                CircleImage(
                    image: Image("turtlerock"), 
                    size: nil
                )
                
                Text(pet.emoji)
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

#Preview {
    PetCardView(pet: Pet(name: "Luchito", kind: .cat))
}
