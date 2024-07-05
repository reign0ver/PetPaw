//
//  PetProfileView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 3/06/24.
//

import SwiftUI

// TODOSITO: Naming🤔
enum PersonalInfoItem {
    case vaccinate
    case feeding
    case treatments
    case others
    
    var icon: String {
        switch self {
        case .vaccinate: "💉"
        case .feeding: "🍪"
        case .treatments: "🩺"
        case .others: "❓"
        }
    }
    
    var name: String {
        switch self {
        case .vaccinate: "Mis vacunas"
        case .feeding: "Mi alimentación"
        case .treatments: "Mis tratamientos"
        case .others: "Otros"
        }
    }
}

extension PersonalInfoItem: CaseIterable {}

extension PersonalInfoItem: Identifiable {
    var id: Self { self }
}

struct PetProfileView: View {
    private let items = PersonalInfoItem.allCases
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .listRowSeparatorLeading) {
                headerView()
                Section(
                    content: {
                        ForEach(items, id: \.self) { item in
                            NavigationLink(
                                destination: { Text("Detail view") },
                                label: { PetPersonalInfoRow(item: item) }
                            )
                            .buttonStyle(PlainButtonStyle())
                        }
                    },
                    header: {
                        PetPersonalInfoSectionHeader(title: "About Martina")
                    }
                )
            }
            .padding()
        }
    }
    
    
    @ViewBuilder
    func headerView() -> some View {
        VStack(spacing: 12) {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    CircleImage(
                        image: Image("turtlerock"),
                        size: CGSize(width: 80, height: 80)
                    )
                    Text("Martina")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("@LaPeligrosa")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                //.background(Color.red)
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text("Criollo")
                    Text("4.5 kg")
                    Text("8 years and 2 months")
                }
                .font(.callout)
                //.background(Color.yellow)
            }
            // Bio
            Text("Hola! Soy Martina, la gata más bonita de mi casita. Mi papá adoptivo diría que es Lusho, pero es mentira, yo soy, Lusho es feo y cansón 😉")
        }
        .padding(.horizontal)
    }
}


#Preview {
    PetProfileView()
}
