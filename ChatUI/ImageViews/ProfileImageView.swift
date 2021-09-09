//
//  ProfileImageView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/8/21.
//

import SwiftUI

struct ProfileImageView: View {
    var imageName: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding()
            }
        .padding(.horizontal)
//        .frame(height: 90)
        .background(Color.white)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(imageName: "person")
    }
}
