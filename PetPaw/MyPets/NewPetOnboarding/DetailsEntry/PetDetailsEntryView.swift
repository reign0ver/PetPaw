//
//  PetDetailsEntryView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 22/04/24.
//

import SwiftUI
import PhotosUI
import Foundation

struct PetDetailsEntryView: View {
    @State private var name = ""
    @State private var birthday = Date.now
    @State private var gender = "Boy"
    @State private var bio = ""
    @State private var weight: Double = 1
    
    @State private var bioCharsExceeded = false
    @State private var isBioEmpty = true
    
    @FocusState private var isNameFocused: Bool
    @FocusState private var isBioFocused: Bool
    
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    @ObservedObject private var appState: AppState
    @ObservedObject private var coordinator: PetOnboardingCoordinator
    @ObservedObject private var viewModel: PetDetailsViewModel = PetDetailsViewModel()
    
    private var genderList = [
        "Boy",
        "Girl",
        "Other"
    ]
    
    private let petKind: PetKind
    
    init(
        petKind: PetKind,
        appState: AppState,
        coordinator: PetOnboardingCoordinator
    ) {
        self.petKind = petKind
        self.appState = appState
        self.coordinator = coordinator
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
                TextField(
                    "Localized",
                    value: $weight,
                    format: .number,
                    prompt: Text("Prompt 1,5")
                )
                .keyboardType(.decimalPad)
            }
            
            Section("Bio") {
                TextEditorWithCharCounter(
                    text: $bio,
                    placeholderText: "Want to tell us more about your friend?",
                    height: 120,
                    maxLength: 240,
                    onMaxLengthExceeded: { exceeded in
                        bioCharsExceeded = exceeded
                    },
                    onEmpty: { isEmpty in
                        isBioEmpty = isEmpty
                    }
                )
            }
            
            Spacer()
                .listRowBackground(Color.clear)
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
        coordinator.complete()
        appState.pets.append(getPetInfo())
    }
    
    private func getPetInfo() -> Pet {
        Pet(
            name: name,
            kind: petKind,
            weight: weight,
            birthdayDate: birthday,
            profile: PetProfileInfo(bio: bio, profileImage: viewModel.selectedImage)
        )
    }
}

#if DEBUG
#Preview {
    PetDetailsEntryView(petKind: .cat, appState: AppState(), coordinator: PetOnboardingCoordinator())
}
#endif
