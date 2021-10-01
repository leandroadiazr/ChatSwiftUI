//
//  ChatView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/7/21.
//

import SwiftUI

struct ChatView: View {
    @State var inputText: String = ""
    @ObservedObject var viewModel = ChatViewModel()

    var body: some View {
        //MARK:- Main V Stack
        VStack {
            //MARK:-  Messages
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                }
            }
            
            // Input View
            CustomInputView(inputText: $inputText, action: {
//                viewModel.sendMessages(inputText)
                sendMessage()
                
            })
        }
        .navigationTitle("Chats")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
        
    }
    func sendMessage() {
        viewModel.sendMessages(inputText)
        inputText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
