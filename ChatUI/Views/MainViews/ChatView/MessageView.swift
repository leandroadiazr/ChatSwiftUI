//
//  MessageView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/12/21.
//

import SwiftUI

struct MessageView: View {
    var isFromCurrentUser: Bool
    var body: some View {
        HStack {
            if isFromCurrentUser {
                
            } else {
                HStack(alignment: .bottom) {
                    ProfileImageView(imageName: Image(systemName: "person"), frameWidth: 34, frameHeight: 34)
                   
                    Text("Ctest test test restasdfasdfadsfasdf")
                        .padding(12)
                        .background(Color(.systemGray4))
                        .font(.body)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 20)
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(isFromCurrentUser: false)
    }
}
