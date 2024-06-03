//
//  AddPetProfileView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI
import Foundation

struct AddPetProfileView: View {
    @State private var name = ""
    @State private var birthday = Date.now
    @State private var gender = "Boy"
    @State private var nickname = ""
    
    private var genderList = [
        "Boy",
        "Girl",
        "Other"
    ]
    
    var body: some View {
        Form {
            ZStack {
                VStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                    
                    Text("Add photo")
                    
                    Text("Optional")
                        .font(.caption)
                        .italic()
                }
                
                Button(
                    action: {
                        print("Add photo action")
                    },
                    label: {}
                )
            }.padding()
            
            
            Section("What is your pet's name?") {
                TextField("Name", text: $name)
            }
            
            Section("What is your pet's birthday?") {
                // We can limit the years to 20 years ago
                // No reason to load all that data, there's no pet that old xD
                DatePicker(
                    "Select the date",
                    selection: $birthday,
                    displayedComponents: .date
                )
            }
            
            Section("Pet's gender") {
                Picker("Gender", selection: $gender) {
                    ForEach(genderList, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            Section("Your buddy's nickname") {
                TextField("Nickname", text: $nickname)
            }
        }
    }
}

#Preview {
    AddPetProfileView()
}
