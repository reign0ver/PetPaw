//
//  PetPersonalInfoSectionHeader.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 4/07/24.
//

import SwiftUI

struct PetPersonalInfoSectionHeader: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.horizontal)
            .padding(.top, 12)
    }
}

#Preview {
    PetPersonalInfoSectionHeader(title: "My personal info")
}
