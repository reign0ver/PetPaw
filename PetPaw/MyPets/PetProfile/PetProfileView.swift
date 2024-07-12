//
//  PetProfileView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 3/06/24.
//

import SwiftUI

struct PetProfileView: View {
    let pet: Pet
    
    var body: some View {
        List {
            Section {
                headerView()
                    .padding(.vertical, 12)
            }
            
            Section("About \(pet.name)") {
                ForEach(pet.profile.additionalInfo, id: \.self) { item in
                    NavigationLink(
                        destination: { PetPersonalInfoRow(item: item) },
                        label: { PetPersonalInfoRow(item: item) }
                    )
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .listStyle(.insetGrouped)
        .listSectionSpacing(0)
        .navigationTitle(pet.name)
    }
    
    
    @ViewBuilder
    func headerView() -> some View {
        VStack(spacing: 12) {
            VStack(alignment: .center) {
                VStack {
                    Image("turtlerock")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                    Text(pet.name)
                        .font(.headline)
                    Text("@LaLeona")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 12) {
                    HStack {
                        Text(pet.kind.emoji)
                        Text(pet.kind.name)
                    }
                    Divider()
                    HStack {
                        Text("🏋🏼‍♀️")
                        Text(pet.weight, format: .number.precision(.fractionLength(1)))
                    }
                    Divider()
                    HStack {
                        Text("🐣")
                        Text("\(pet.age)")
                    }
                }
                .font(.footnote)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            Text(pet.profile.bio)
                .font(.subheadline)
        }
    }
}

#if DEBUG
#Preview {
    PetProfileView(
        pet: Pet(
            name: "Martina",
            kind: .cat,
            weight: 4.5,
            age: 8,
            profile: PetProfileInfo(
                bio: "Hola! Soy Martina, la gata más bonita de mi casita. Mi papá adoptivo diría que es Lusho, pero es mentira, yo soy, Lusho es feo y cansón 😉"
            )
        )
    )
}
#endif
