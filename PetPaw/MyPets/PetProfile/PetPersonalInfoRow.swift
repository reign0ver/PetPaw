//
//  PetPersonalInfoRow.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 4/07/24.
//

import SwiftUI

struct PetPersonalInfoRow: View {
    let item: PetInfoCategory
    
    var body: some View {
        HStack {
            Label(
                title: { Text(item.name) },
                icon: { Text(item.icon) }
            )
        }
        .contentShape(Rectangle())
    }
}

#if DEBUG
#Preview {
    PetPersonalInfoRow(item: .vaccinate)
}
#endif
