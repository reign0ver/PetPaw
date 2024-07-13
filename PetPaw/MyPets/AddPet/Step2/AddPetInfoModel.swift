//
//  AddPetInfoModel.swift
//  PetPaw
//
//  Created by Andrés Carrillo on 10/07/24.
//

import SwiftUI
import PhotosUI
import Foundation
import CoreTransferable

final class AddPetInfoModel: ObservableObject {
    @Published private(set) var imageState: ImageState = .empty
    @Published var imageSelection: PhotosPickerItem? = nil {
        didSet {
            if let imageSelection {
                _ = loadImage(from: imageSelection)
                imageState = .loading
            } else {
                imageState = .empty
            }
        }
    }
    
    private(set) var selectedImage: Image?
    
    private func loadImage(from imageSelection: PhotosPickerItem) -> Progress {
        return imageSelection.loadTransferable(
            type: TransferableImage.self,
            completionHandler: { result in
                DispatchQueue.main.async {
                    guard imageSelection == self.imageSelection else {
                        print("Failed to get the selected item.")
                        return
                    }
                    switch result {
                    case .success(let profileImage?):
                        self.imageState = .success(profileImage.image)
                        self.selectedImage = profileImage.image
                    case .success(nil):
                        self.imageState = .empty
                    case .failure(let error):
                        self.imageState = .failure(error)
                    }
                }
            }
        )
    }
}

extension AddPetInfoModel {
    struct TransferableImage: Transferable {
        let image: Image
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { imageData in
                guard let uiImage = UIImage(data: imageData) else {
                    throw TransferError.importFailed
                }
                let suImage = Image(uiImage: uiImage)
                return TransferableImage(image: suImage)
            }
        }
    }
}

extension AddPetInfoModel {
    enum ImageState {
        case empty
        case loading
        case success(Image)
        case failure(Error)
    }
    
    enum TransferError: Error {
        case importFailed
    }
}
