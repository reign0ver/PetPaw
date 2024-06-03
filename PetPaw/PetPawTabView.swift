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
                    Image(systemName: "house")
                    Text("Home")
                }
            
            MyPetsView()
                .tabItem {
                    Image(systemName: "pawprint")
                    Text("My Pets")
                }
            
            MyProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("My Profile")
                }
        }
    }
}

#Preview {
    PetPawTabView()
}
