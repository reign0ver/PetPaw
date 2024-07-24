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
    let age: Int
    let profile: PetProfileInfo
}

struct PetProfileInfo: Identifiable {
    let id = UUID()
    let bio: String
    let profileImage: Image?
    
    var unwrappedProfileImage: Image {
        profileImage ?? Image(systemName: "photo.fill.on.rectangle.fill")
    }
}
