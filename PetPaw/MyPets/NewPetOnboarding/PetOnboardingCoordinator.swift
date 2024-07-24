//
//  PetOnboardingCoordinator.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 19/07/24.
//

import SwiftUI

final class PetOnboardingCoordinator: ObservableObject {
    @Published var isActive = false
    @Published var navigationPath = NavigationPath()
    
    func start() {
        isActive = true
        navigationPath = NavigationPath()
    }
    
    func cancel() {
        isActive = false
        navigationPath = NavigationPath()
    }
    
    func complete() {
        isActive = false
        navigationPath = NavigationPath()
    }
    
    func moveToNextStep() {
        navigationPath.append(OnboardingStep.detailsEntry)
    }
}

extension PetOnboardingCoordinator {
    enum OnboardingStep: Hashable {
        case typeSelection
        case detailsEntry
    }
}
