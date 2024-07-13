//
//  SelectablePetTypeRow.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 13/07/24.
//

import SwiftUI

struct SelectablePetTypeRow: View {
    @Binding private var selectedType: PetKind?
    private let petType: PetKind
    
    init(
        petType: PetKind,
        selectedType: Binding<PetKind?>
    ) {
        self.petType = petType
        _selectedType = selectedType
    }
    
    var body: some View {
        HStack {
            Label(
                title: { Text(petType.name) },
                icon: { Text(petType.emoji) }
            )
            
            Spacer()
            
            if selectedType == petType {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            guard selectedType != petType else { return }
            selectedType = petType
        }
    }
}

#Preview {
    SelectablePetTypeRow(
        petType: .cat,
        selectedType: .constant(.cat)
    )
}
