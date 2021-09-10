//
//  ProfileImageView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/8/21.
//

import SwiftUI

struct ProfileImageView: View {
    var imageName: Image
    var body: some View {
        HStack {
            imageName
                .resizable()
                .scaledToFit()
                .frame(width: 84, height: 84)
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
        ProfileImageView(imageName: Image(systemName: "person"))
    }
}
