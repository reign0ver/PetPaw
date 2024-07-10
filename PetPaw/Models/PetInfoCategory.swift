//
//  PetInfoCategory.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 5/07/24.
//

enum PetInfoCategory {
    case vaccinate
    case feeding
    case treatments
    case others
    
    var icon: String {
        switch self {
        case .vaccinate: "💉"
        case .feeding: "🍪"
        case .treatments: "🩺"
        case .others: "❓"
        }
    }
    
    var name: String {
        switch self {
        case .vaccinate: "Mis vacunas"
        case .feeding: "Mi alimentación"
        case .treatments: "Mis tratamientos"
        case .others: "Otros"
        }
    }
}

extension PetInfoCategory: Identifiable {
    var id: Self { self }
}

extension PetInfoCategory: CaseIterable {}
