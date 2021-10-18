//
//  UserProfileImageSelector.swift
//  ChatUI
//
//  Created by Leandro Diaz on 10/16/21.
//

import SwiftUI

struct UserProfileImageSelector: View {
    @Binding var imagePickerPresented: Bool
    @Binding var profileImage: Image?
    @Binding var selectedImage: UIImage?
    var action: () -> Void?
    
    private func loadSelectedImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    var body: some View {
        VStack {
            Image(Images.startsYellow)
                .padding(.top, 140)
            Button {
                //select image action
                action()
            } label: {
                if let profileImage = profileImage {
                    ProfileImageView(imageName: profileImage, frameWidth: 120, frameHeight: 120)
                        .offset(y: -70)
                } else {
                    Image(systemName: Images.bubbleImage)
                        .resizable()
                        .frame(width: 120, height: 100, alignment: .center)
                        .foregroundColor(.green)
                        .offset(y: -70)
                }
            }
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadSelectedImage) {
                SwiftUIImagePicker(image: $selectedImage)
            }
        }
    }
}


struct UserProfileImageSelector_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileImageSelector(imagePickerPresented: .constant(false), profileImage: .constant(Image(systemName: "person")), selectedImage: .constant(UIImage(systemName: "person.fill"))) {
            //
        }
    }
}
