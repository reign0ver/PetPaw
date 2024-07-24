//
//  OnboardingContainerView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 21/07/24.
//

import SwiftUI

struct OnboardingContainerView: View {
    @ObservedObject private var appState: AppState
    @ObservedObject private var coordinator: PetOnboardingCoordinator
    
    init(appState: AppState, coordinator: PetOnboardingCoordinator) {
        self.appState = appState
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            PetTypeSelectionView(appState: appState, coordinator: coordinator)
                .navigationDestination(
                    for: PetOnboardingCoordinator.OnboardingStep.self,
                    destination: { step in
                        switch step {
                        case .typeSelection:
                            PetTypeSelectionView(appState: appState, coordinator: coordinator)
                        case .detailsEntry:
                            PetDetailsEntryView(appState: appState, coordinator: coordinator)
                        }
                    }
                )
        }
    }
}
