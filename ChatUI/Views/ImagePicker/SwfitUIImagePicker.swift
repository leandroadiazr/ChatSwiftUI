//
//  SwfitUIImagePicker.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/10/21.
//

import SwiftUI
import UIKit

struct SwiftUIImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
     
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: SwiftUIImagePicker
        
        init(_ parent: SwiftUIImagePicker) {
            self.parent = parent
        }
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else { return }
            
            self.parent.image = image
            
            self.parent.mode.wrappedValue.dismiss()
        }
    }

}
