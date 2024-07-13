//
//  AppState.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 12/07/24.
//

import SwiftUI
import Foundation

// TODOSITO: Temporary file to persist data in runtime,
// should be removed once we implement some local cache framework
class AppState: ObservableObject {
    @Published var pets: [Pet] = [
        Pet(
            name: "Martina",
            kind: .cat,
            weight: 4.5,
            age: 8,
            profile: PetProfileInfo(
                bio: "Hola! Soy Martina, la gata más bonita de mi casita. Mi papá adoptivo diría que es Lusho, pero es mentira, yo soy, Lusho es feo y cansón 😉",
                profileImage: Image("turtlerock")
            )
        ),
        Pet(
            name: "Chispita",
            kind: .cat,
            weight: 4.5,
            age: 9,
            profile: PetProfileInfo(
                bio: "Hola! Soy Chispita, una gatita albina de 9 años. Soy un poco nerviosa pero muy amorosa, hace poquito me dejaron sin dientes pero me veo muy linda muequita❤️",
                profileImage: Image("turtlerock")
            )
        ),
        Pet(
            name: "Mili",
            kind: .cat,
            weight: 4.5,
            age: 10,
            profile: PetProfileInfo(
                bio: "Hola! Soy Mili, tengo 10 añitos, soy una gata muy peluda, digo que soy angora pero no sé si lo soy😜. Soy muy interesada, solo doy amor a cambio de Churu😾",
                profileImage: Image("turtlerock")
            )
        )
    ]
}
