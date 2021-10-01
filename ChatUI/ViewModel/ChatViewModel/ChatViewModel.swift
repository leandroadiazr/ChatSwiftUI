//
//  ChatViewModel.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/19/21.
//

import Foundation


class ChatViewModel: ObservableObject {
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
    }
    
    
    
    func sendMessages(_ messageText: String) {
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
    }
    
    
    
    var mockMessages: [Message] {
        
        [
            .init(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalbablablablalbablablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalba"),  .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalbablablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalba"),  .init(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalbablablablalbablablablalbablablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalba"),  .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalbablablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalba"),  . init(isFromCurrentUser: true, messageText: "blablablalba"),   .init(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalbablablablalbablablablalbablablablalba"),   .init(isFromCurrentUser: false, messageText: "blablablalba")]
    }
}
