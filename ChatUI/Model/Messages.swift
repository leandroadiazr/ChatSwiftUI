//
//  Messages.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/19/21.
//

import Foundation

struct Message: Identifiable {
    var id = UUID().uuidString
    
    let isFromCurrentUser: Bool
    let messageText: String
}


//let mockedMessages = [Message(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalbablablablalba"),Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalba"),Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalbablablablalbablablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalba"),Message(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalbablablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalba"), Message(isFromCurrentUser: true, messageText: "blablablalbablablablalbablablablalba"), Message(isFromCurrentUser: false, messageText: "blablablalba")]
