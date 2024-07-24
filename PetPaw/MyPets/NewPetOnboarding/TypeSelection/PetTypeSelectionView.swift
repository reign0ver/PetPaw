//
//  PetTypeSelectionView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI

struct PetTypeSelectionView: View {
    @State private var selectedKind: PetKind?
    
    @ObservedObject private var appState: AppState
    @ObservedObject private var coordinator: PetOnboardingCoordinator
    
    init(
        appState: AppState,
        coordinator: PetOnboardingCoordinator
    ) {
        self.appState = appState
        self.coordinator = coordinator
    }
    
    var body: some View {
        List {
            Section {
                Text("What kind of pet do you have?")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)
            }
            .listRowBackground(Color.clear)
            
            ForEach(PetKind.allCases, id: \.self) { kind in
                SelectablePetTypeRow(
                    petType: kind,
                    selectedType: $selectedKind
                )
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("New pet")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                nextButton
                    .disabled(selectedKind == nil)
            }
            
            ToolbarItem(placement: .topBarLeading) {
                cancelButton
            }
        }
    }
    
    private var nextButton: some View {
        Button(
            action: { coordinator.moveToNextStep() },
            label: { Text("Next").bold() }
        )
    }
    
    private var cancelButton: some View {
        Button(
            action: { coordinator.cancel() },
            label: { Text("Cancel") }
        )
    }
}

#if DEBUG
#Preview {
    PetTypeSelectionView(appState: AppState(), coordinator: PetOnboardingCoordinator())
}
#endif
