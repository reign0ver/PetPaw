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
    
    private var genderList = [
        "Boy",
        "Girl",
        "Other"
    ]
    
    var body: some View {
        Form {
            Section {
                Button(
                    action: {},
                    label: { addProfilePhotoView }
                )
                .buttonStyle(PlainButtonStyle())
            }
            .listRowBackground(Color.clear)
            .frame(maxWidth: .infinity)
            .padding()
            
            Section("What is your pet's name?") {
                TextField("Name", text: $name)
            }
            
            Section("What is your pet's birthday?") {
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
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                nextButton
            }
        }
    }
    
    private var nextButton: some View {
        NavigationLink(
            destination: PetProfileView(),
            label: { Text("Next").bold() }
        )
    }
    
    private var addProfilePhotoView: some View {
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
    }
}

#if DEBUG
#Preview {
    AddPetProfileView()
}
#endif
