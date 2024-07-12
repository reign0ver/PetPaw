//
//  CircleImage.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 3/04/24.
//

import SwiftUI

struct CircleImage: View {
    @ViewBuilder var image: Image
    var size: CGSize?
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .clipShape(Circle())
            .shadow(radius: 6)
            .frame(width: size?.width, height: size?.height)
    }
}

#if DEBUG
#Preview {
    CircleImage(
        image: {
            Image("turtlerock")
        },
        size: CGSize(width: 200, height: 200)
    )
}
#endif
