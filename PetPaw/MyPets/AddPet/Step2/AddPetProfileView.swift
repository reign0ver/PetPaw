//
//  AddPetProfileView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI
import PhotosUI
import Foundation

// TODOSITO: I don't like this name...
// Pending to change it
struct AddPetProfileView: View {
    // TODOSITO: Naming
    @Binding private var isPresented: Bool
    
    @State private var name = ""
    @State private var birthday = Date.now
    @State private var gender = "Boy"
    @State private var bio = ""
    @State private var weight: Double?
    
    @State private var bioCharsExceeded = false
    @State private var isBioEmpty = true
    
    @FocusState private var isNameFocused: Bool
    @FocusState private var isBioFocused: Bool
    
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    @ObservedObject private var viewModel: AddPetInfoModel = AddPetInfoModel()
    @ObservedObject private var appState: AppState
    
    private var genderList = [
        "Boy",
        "Girl",
        "Other"
    ]
    
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    init(
        isPresented: Binding<Bool>,
        appState: AppState
    ) {
        _isPresented = isPresented
        self.appState = appState
    }
    
    var body: some View {
        Form {
            Section {
                photosPickerView
            }
            .listRowBackground(Color.clear)
            .frame(maxWidth: .infinity)
            .padding()
            
            Section("What is your pet's name?") {
                TextField("Adamito Carrito Pérez", text: $name)
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
            
            Section("Weight") {
                TextField("4,5", value: $weight, formatter: formatter)
                    .keyboardType(.decimalPad)
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
        .alert(
            isPresented: $showAlert,
            content: {
                Alert(
                    title: Text("Congrats"),
                    message: Text("Your pet was added successfully"), // Copy, tengo sueño
                    dismissButton: .default(Text("Done").bold(), action: dismissModal)
                )
            }
        )
        .scrollDismissesKeyboard(.interactively)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                finishButton
                    .disabled(name.isEmpty || isBioEmpty || bioCharsExceeded)
            }
        }
    }
    
    private var finishButton: some View {
        Button(
            action: { showAlert = true },
            label: { Text("Finish").bold() }
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
    
    private var photosPickerView: some View {
        PhotosPicker(
            selection: $viewModel.imageSelection,
            matching: .images,
            photoLibrary: .shared(),
            label: {
                EditableCircularPetProfileImageView(viewModel: viewModel)
            }
        )
        .buttonStyle(PlainButtonStyle())
    }
    
    private func dismissModal() {
        isPresented = false
        appState.pets.append(getPetInfo())
    }
    
    private func getPetInfo() -> Pet {
        Pet(
            name: name,
            kind: .cat, // comes from the previous screen
            weight: weight ?? 1,
            age: 4, // calculate from date
            profile: PetProfileInfo(bio: bio, profileImage: viewModel.selectedImage)
        )
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#if DEBUG
#Preview {
    AddPetProfileView(isPresented: .constant(true), appState: AppState())
}
#endif
