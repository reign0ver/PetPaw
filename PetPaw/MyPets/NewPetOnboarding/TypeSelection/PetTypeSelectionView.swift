//
//  PetTypeSelectionView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI

struct PetTypeSelectionView: View {
    @ObservedObject private var appState: AppState
    
    @Binding private var isPresented: Bool
    @State private var selectedKind: PetKind?
    
    init(
        isPresented: Binding<Bool>,
        appState: AppState
    ) {
        _isPresented = isPresented
        self.appState = appState
    }
    
    var body: some View {
        NavigationStack {
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Add new pet")
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
    }
    
    private var nextButton: some View {
        NavigationLink(
            destination: PetDetailsEntryView(isPresented: $isPresented, appState: appState),
            label: { Text("Next").bold() }
        )
    }
    
    private var cancelButton: some View {
        Button(
            action: { isPresented = false },
            label: { Text("Cancel") }
        )
    }
}

#if DEBUG
#Preview {
    PetTypeSelectionView(isPresented: .constant(true), appState: AppState())
}
#endif
