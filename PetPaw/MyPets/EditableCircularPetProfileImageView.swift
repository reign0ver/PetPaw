//
//  EditableCircularPetProfileImageView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 10/07/24.
//

import SwiftUI

struct EditableCircularPetProfileImageView: View {
    @ObservedObject var viewModel: AddPetInfoModel
    
    var body: some View {
        switch viewModel.imageState {
        case .empty:
            emptyView
        case .loading:
            ProgressView()
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 120, height: 120)
                .overlay {
                    Circle()
                        .stroke(
                            Color(uiColor: .placeholderText),
                            lineWidth: 0.5
                        )
                }
        case .failure:
            errorView
        }
    }
    
    private var emptyView: some View {
        Circle()
            .fill(Color(uiColor: .systemGray5))
            .stroke(
                Color(uiColor: .placeholderText),
                lineWidth: 0.5
            )
            .frame(width: 120, height: 120)
            .overlay {
                Image(systemName: "photo.badge.plus.fill")
                    .imageScale(.large)
                    .foregroundStyle(Color.gray)
                    .symbolRenderingMode(.multicolor)
            }
    }
    
    private var errorView: some View {
        Circle()
            .fill(Color.gray)
            .stroke(
                Color(uiColor: .placeholderText),
                lineWidth: 0.5
            )
            .frame(width: 120, height: 120)
            .overlay {
                Image(systemName: "exclamationmark.triangle.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundStyle(.white)
            }
    }
}

#if DEBUG
#Preview {
    EditableCircularPetProfileImageView(viewModel: AddPetInfoModel())
}
#endif
