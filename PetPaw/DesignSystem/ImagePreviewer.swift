//
//  ImagePreviewer.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 13/07/24.
//

import SwiftUI

struct ImagePreviewer: View {
    let image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { width, _ in
                width * 0.9
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ImagePreviewer(image: Image(systemName: "person"))
}
