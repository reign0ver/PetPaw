//
//  MyPetsListView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 1/04/24.
//

import SwiftUI

struct MyPetsListView: View {
    @ObservedObject private var appState: AppState = AppState()
    
    @State private var isPresented = false
    
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
            .sheet(isPresented: $isPresented, content: {
                PetTypeSelectionView(isPresented: $isPresented, appState: appState)
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: { isPresented = true },
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
