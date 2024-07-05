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
            VStack(alignment: .leading, spacing: 10) {
                Text("Large Title").font(.largeTitle)
                Text("Title").font(.title)
                Text("Title 2").font(.title2)
                Text("Title 3").font(.title3)
                Text("Headline").font(.headline)
                Text("Subheadline").font(.subheadline)
                Text("Body").font(.body)
                Text("Callout").font(.callout)
                Text("Footnote").font(.footnote)
                Text("Caption").font(.caption)
                Text("Caption 2").font(.caption2)
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
