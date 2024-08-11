//
//  PetOnboardingCoordinator.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 19/07/24.
//

import SwiftUI

final class PetOnboardingCoordinator: ObservableObject {
    @Published var isActive = false
    @Published var canProceed = false
    @Published var navigationPath: [OnboardingStep] = []
    
    func start() {
        isActive = true
        navigationPath = []
    }
    
    func cancel() {
        isActive = false
        navigationPath = []
    }
    
    func complete() {
        isActive = false
        navigationPath = []
    }
    
    func moveTo(step: OnboardingStep) {
        navigationPath.append(step)
    }
}

extension PetOnboardingCoordinator {
    enum OnboardingStep: Hashable {
        case typeSelection
        case detailsEntry(petKind: PetKind)
    }
}
