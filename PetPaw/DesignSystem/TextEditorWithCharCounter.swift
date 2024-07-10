//
//  TextEditorWithCharCounter.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 10/07/24.
//

import SwiftUI

struct TextEditorWithCharCounter: View {
    @Binding var text: String
    let placeholderText: String
    let height: CGFloat
    let maxLength: Int
    let onMaxLengthExceeded: (Bool) -> Void
    let onEmpty: (Bool) -> Void
    
    // TODOSITO: Naming
    private var availableChars: Int {
        return maxLength - text.count
    }
    
    private var countColor: Color {
        if availableChars >= 0 {
            return .gray
        } else {
            return .red
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextEditorWithPlaceholder(
                text: $text,
                placeholderText: placeholderText,
                height: height
            )
            
            HStack {
                Spacer()
                Text("\(availableChars)")
                    .font(.footnote)
                    .foregroundColor(countColor)
                    .padding(.trailing)
            }
        }
        .onChange(of: text) { _, newValue in
            // Refactor in a separate function
            // add color validation here too
            // available chars logic can be here too as a @State view's property
            if newValue.count > maxLength {
                onMaxLengthExceeded(true)
            } else {
                onMaxLengthExceeded(false)
            }
            
            if newValue.isEmpty {
                onEmpty(true)
            } else {
                onEmpty(false)
            }
        }
    }
}

#if DEBUG
#Preview {
    TextEditorWithCharCounter(
        text: .constant("Mi mascota es un gran regalo para mí."),
        placeholderText: "Quieres contarnos algo acerca de tu mascota?",
        height: 120,
        maxLength: 240,
        onMaxLengthExceeded: { _ in },
        onEmpty: { _ in }
    )
}
#endif
