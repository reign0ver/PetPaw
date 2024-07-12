//
//  CircularPetProfileImageView.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 10/07/24.
//

import SwiftUI

struct CircularPetProfileImageView: View {
    let imageState: AddPetInfoModel.ImageState
    
    var body: some View {
        switch imageState {
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
    CircularPetProfileImageView(imageState: .empty)
}
#endif
