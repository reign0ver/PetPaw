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
        CircularPetProfileImageView(imageState: viewModel.imageState)
    }
}

#if DEBUG
#Preview {
    EditableCircularPetProfileImageView(viewModel: AddPetInfoModel())
}
#endif
