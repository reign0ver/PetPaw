//
//  MyPetsListView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 1/04/24.
//

import SwiftUI

struct MyPetsListView: View {
    @StateObject private var appState: AppState = AppState()
    @StateObject private var coordinator = PetOnboardingCoordinator()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(appState.pets) { pet in
                    NavigationLink(
                        destination: { PetProfileView(pet: pet) },
                        label: { PetCardView(pet: pet) }
                    )
                }
            }
            .navigationTitle("My Pets")
            .sheet(isPresented: $coordinator.isActive, content: {
                OnboardingContainerView(appState: appState, coordinator: coordinator)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: { coordinator.start() },
                        label: {
                            Image(systemName: "plus")
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    MyPetsListView()
}
