//
//  UserCell.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/10/21.
//

import SwiftUI
import Kingfisher


struct ConversationCell: View {
    @State var profileImage = Image(systemName: "person")
    @State var userName: String = "Leandro Diaz"
    @State var message: String = "This is te first message test"
    @State var timeStamp: String = "10 aug 2021"
    
    
    var body: some View {
        HStack {
            ProfileImageView(imageName: profileImage, frameWidth: 48, frameHeight: 48, backgroundColor: .clear)
            
            VStack(alignment: .leading) {
                Text(userName)
                    .font(.system(size: 14, weight: .semibold))
                Text(message)
                    .font(.footnote)
            }
            Spacer()
            Text(timeStamp)
                .foregroundColor(.gray)
                .font(.footnote)
                .padding(.horizontal)
//            Spacer()
        }
        //        .frame(width: 48, height: 48, alignment: .center)
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            ConversationCell()
        }
    }
}
