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
    @State private var weight: Double?
    
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
    
    #warning("Refactor this and all @State properties from this View")
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    init(
        appState: AppState,
        coordinator: PetOnboardingCoordinator
    ) {
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
        coordinator.complete()
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
    PetDetailsEntryView(appState: AppState(), coordinator: PetOnboardingCoordinator())
}
#endif
