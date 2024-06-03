//
//  AddKindOfPetView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI

struct AddKindOfPetView: View {
    
    private var layout: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 140), spacing: 36)
    ]
    
    private var breeds = [
        "Perro",
        "Gato"
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("What kind of pet do you have?")
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
            
            ScrollView(.vertical) {
                LazyVGrid(columns: layout, spacing: 36) {
                    ForEach(breeds, id: \.self) { pet in
                        Button(
                            action: {
                                print("Pressed kind")
                            },
                            label: {
                                KindOfPetView(image: Image("turtlerock"), name: pet)
                            }
                        ).foregroundStyle(.black)
                    }
                }
                .padding()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                NavigationLink(
                    destination: AddPetProfileView(),
                    label: {
                        HStack {
                            Text("Next")
                            Image(systemName: "chevron.forward")
                        }

                    }
                )
            }
            .padding()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func KindOfPetView(image: Image, name: String) -> some View {
        VStack(spacing: 8) {
            CircleImage(image: image, size: nil)
                .layoutPriority(-1)
            
            Text(name)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
    }
}

#Preview {
    AddKindOfPetView()
}
