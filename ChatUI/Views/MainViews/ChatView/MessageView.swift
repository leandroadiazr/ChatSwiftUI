//
//  MessageView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/12/21.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser: Bool
    var messageText: String
    
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                HStack(alignment: .bottom) {
                    Text(messageText)
                        .padding(12)
                        .background(Color(.systemBlue))
                        .font(.body)
                        .clipShape(ChatBubble(isFromCurrentUser: true))
                        .foregroundColor(.white)
                    ProfileImageView(imageName: Image(systemName: "person"), frameWidth: 34, frameHeight: 34)
                      
                }
                .padding(.horizontal, 1)
                .padding(.leading, 35)
                
                
            } else {
                HStack(alignment: .bottom) {
                    ProfileImageView(imageName: Image(systemName: "person"), frameWidth: 34, frameHeight: 34)
                   
                    Text(messageText)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .font(.body)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 35)
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(isFromCurrentUser: true, messageText: "")
    }
}
