//
//  CircleImage.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 3/04/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var size: CGSize?
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(Circle())
            .shadow(radius: 6)
            .frame(width: size?.width, height: size?.height)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"), size: CGSize(width: 200, height: 200))
}
