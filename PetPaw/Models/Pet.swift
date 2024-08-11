//
//  Pet.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 5/07/24.
//

import SwiftUI
import Foundation

struct Pet: Identifiable {
    let id = UUID()
    let name: String
    let kind: PetKind
    let weight: Double
    let birthdayDate: Date
    let profile: PetProfileInfo
    
    var age: (years: Int, months: Int) {
        let ageInDateComponents = birthdayDate.age
        let years = ageInDateComponents.year ?? 0
        let months = ageInDateComponents.month ?? 0
        return (years, months)
    }
}

struct PetProfileInfo: Identifiable {
    let id = UUID()
    let bio: String
    let profileImage: Image?
    
    var unwrappedProfileImage: Image {
        profileImage ?? Image(systemName: "photo.fill.on.rectangle.fill")
    }
}
