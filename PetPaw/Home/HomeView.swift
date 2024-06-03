//
//  HomeView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 1/04/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, Home!")
                .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
