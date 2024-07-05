//
//  PetPersonalInfoRow.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 4/07/24.
//

import SwiftUI

struct PetPersonalInfoRow: View {
    let item: PersonalInfoItem
    
    var body: some View {
        HStack {
            Label(
                title: { Text(item.name) },
                icon: { Text(item.icon) }
            )
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .contentShape(Rectangle())
    }
}

#if DEBUG
#Preview {
    PetPersonalInfoRow(item: .vaccinate)
}
#endif
