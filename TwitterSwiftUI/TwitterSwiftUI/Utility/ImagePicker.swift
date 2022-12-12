//
//  ImagePicker.swift
//  TwitterSwiftUI
//
//  Created by Bertuğ Horoz on 7.12.2022.
//

import SwiftUI

struct imagePicker : UIViewControllerRepresentable {
    @Binding var selectedImage : UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeCoordinator() -> coordinator {
        return coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension imagePicker {
    class coordinator : NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent : imagePicker
        init(_ parent: imagePicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {return}
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
