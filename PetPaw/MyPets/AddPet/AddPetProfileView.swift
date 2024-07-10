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
    @State private var bio = ""
    @State private var bioCharsExceeded = false
    @State private var isBioEmpty = true
    
    @FocusState private var isNameFocused: Bool
    @FocusState private var isBioFocused: Bool
    
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
                    .autocorrectionDisabled()
                    .focused($isNameFocused)
                    .toolbar {
                        // the if statement is a workaround to avoid duplicate toolbars in different textfields
                        // this needs to be changed to use a Hashable enum so @FocusState can diff between different textfields
                        if isNameFocused {
                            ToolbarItemGroup(placement: .keyboard) {
                                keyboardDoneButton
                            }
                        }
                    }
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
            
            Section("Bio") {
                TextEditorWithCharCounter(
                    text: $bio,
                    placeholderText: "Want to tell us more about your friend?",
                    height: 120,
                    maxLength: 240,
                    onMaxLengthExceeded: { exceeded in
                        print("exceeded", exceeded)
                        bioCharsExceeded = exceeded
                    },
                    onEmpty: { isEmpty in
                        print("isBioEmpty", isEmpty)
                        isBioEmpty = isEmpty
                    }
                )
            }
            
            Spacer()
                .listRowBackground(Color.clear)
                .onTapGesture {
                    hideKeyboard()
                }
        }
        .scrollDismissesKeyboard(.interactively)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                nextButton
                    .disabled(name.isEmpty || isBioEmpty || bioCharsExceeded)
            }
        }
    }
    
    private var nextButton: some View {
        NavigationLink(
            destination: Text("Pending to implement"),
            label: { Text("Next").bold() }
        )
    }
    
    private var keyboardDoneButton: some View {
        HStack {
            Spacer()
            Button(
                action: { isNameFocused = false },
                label: { Text("Done").bold() }
            )
        }
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

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#if DEBUG
#Preview {
    AddPetProfileView()
}
#endif
