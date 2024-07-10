//
//  TextEditorWithPlaceholder.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 8/07/24.
//

import SwiftUI

struct TextEditorWithPlaceholder: View {
    @FocusState var isFocused: Bool
    @Binding var text: String
    let placeholderText: String
    let height: CGFloat
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholderText)
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .focused($isFocused)
                .padding(4)
        }
        .frame(height: height)
    }
}

#if DEBUG
#Preview {
    TextEditorWithPlaceholder(text: .constant(""), placeholderText: "Default placeholder", height: 120)
}
#endif
