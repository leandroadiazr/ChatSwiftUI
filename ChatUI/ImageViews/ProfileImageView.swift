//
//  ProfileImageView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/8/21.
//

import SwiftUI

struct ProfileImageView: View {
    var imageName: Image
    var frameWidth: CGFloat = 84
    var frameHeight: CGFloat = 84
    var backgroundColor: Color = .white
    
  
    
    var body: some View {
        HStack {
            imageName
                .resizable()
                .scaledToFit()
                .frame(width: frameWidth, height: frameHeight)
                .clipShape(Circle())
                .padding()
            }
        .frame(width: frameWidth, height: frameHeight)
        .padding(.horizontal)

        .background(backgroundColor)
    }
    

    
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(imageName: Image(systemName: "person"))
    }
}
