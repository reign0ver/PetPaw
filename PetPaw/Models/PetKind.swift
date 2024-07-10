//
//  PetKind.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 5/07/24.
//

enum PetKind {
    case dog
    case cat
    case other
    
    var name: String {
        switch self {
        case .dog: "Dog"
        case .cat: "Cat"
        case .other: "Other"
        }
    }
    
    var emoji: String {
        switch self {
        case .cat: "🐱"
        case .dog: "🐶"
        case .other: "🐾"
        }
    }
}

extension PetKind: Identifiable {
    var id: Self { self }
}

extension PetKind: CaseIterable {}
