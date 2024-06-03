//
//  MyProfileView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 1/04/24.
//

import SwiftUI

struct MyProfileView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, My Profile!")
                .navigationTitle("Profile")
        }
    }
}

#Preview {
    MyProfileView()
}
