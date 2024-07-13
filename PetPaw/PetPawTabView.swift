//
//  PetPawTabView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 31/03/24.
//

import SwiftUI

struct PetPawTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.circle.fill")
                    Text("Home")
                }
            
            MyPetsListView()
                .tabItem {
                    Image(systemName: "pawprint.circle.fill")
                    Text("Pets")
                }
            
            MyProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    PetPawTabView()
}
