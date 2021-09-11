//
//  Constants.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import UIKit
import SwiftUI
import Kingfisher

enum Constants {
    static let screenSize = UIScreen.main.bounds
}

enum Images {
    static let Logo                 = UIImage(systemName: "person")
    static let Avatar               = "emptyAvatar"//UIImage(systemName: "person.circle")
    static let profilePic           =  KFImage( URL(string: "https://picsum.photos/200/300")!)//UIImage(named: "headShot")
    
  
    
//    static let followPlus           = UIImage(systemName: "person.crop.circle.fill.badge.plus")?.withTintColor(CustomColors.CustomRed)
    
    //MARK:- CUSTOMIZED BUTTONS
    static let comment              = UIImage(systemName: "bubble.left")
    static let commented            = UIImage(systemName: "bubble.left.and.bubble.right.fill")
    static let retweet              = UIImage(systemName: "arrow.2.squarepath")
    static let retweeted            = UIImage(systemName: "hands.sparkles.fill")
    static let like                 = UIImage(systemName: "heart")
    static let liked                = UIImage(systemName: "hand.thumbsup.fill")
    static let share                = UIImage(systemName: "square.and.arrow.up")
    static let search               = UIImage(systemName: "magnifyingglass")
    static let newTweet             = UIImage(systemName: "note.text")
    static let menu                 = UIImage(systemName: "square.stack.3d.up")
    static let editUser             = UIImage(systemName: "highlighter")
    static let shareUser            = UIImage(systemName: "paperplane")
    static let saveUserChanges      = UIImage(systemName: "square.and.arrow.down.on.square")
    static let camera      = UIImage(systemName: "camera")
    
    
    //MARK:- BACKGROUND IMAGES
    static let topBackground        = "Ovals"
    static let botBackground        = "BottomOvals"
    static let bubbleImage          = "bubble.left.and.bubble.right.fill"
    static let startsYellow         = "Glitters"
    static let backMedia            = "background"//UIImage(named: "background")
    static let Empty                = UIImage(systemName: "link.icloud.fill")
    static let senderChatBubble     = UIImage(systemName: "bubble.right.fill")
    static let recipientChatBubble  = UIImage(systemName: "bubble.left.fill")
    
    //MARK:- TAB BAR ICONS
    static let home                 = UIImage(systemName: "house")
    static let homeFill             = UIImage(systemName: "house.fill")
    static let feeds                = UIImage(systemName: "newspaper")
    static let feedsFill            = UIImage(systemName: "newspaper.fill")
    static let post                 = UIImage(systemName: "plus.circle.fill")
    static let postFill             = UIImage(systemName: "plus.circle.fill")
    static let discussion           = UIImage(systemName: "rectangle.3.offgrid.bubble.left")
    static let discusFill           = UIImage(systemName: "rectangle.3.offgrid.bubble.left.fill")
    static let userArea             = UIImage(systemName: "person.icloud")
    static let userAreaFill         = UIImage(systemName: "person.icloud.fill")
    static let hiBtnImage           = UIImage(systemName: "rectangle.3.offgrid.bubble.left.fill")
    
    //MARK:- IMPORTED IMAGES
    static let greenPlus            = UIImage(named: "GreenPlus")
    static let buttonActive         = "ButtonActive"
    static let buttonDisable        = UIImage(named: "ButtonDisabled")
    static let loginWithFB          = "loginFB"
    static let loginWGoogle         = "loginGoogle"
    
    //MARK:- CHAT IMAGES
    static let bubbleRight          = UIImage(named: "bubbleRight")
    static let bubbleLeft           = UIImage(named: "bubbleLeft")
    
}


enum CustomGradient {
    static let blueGradient = Gradient(colors: [.white, .blue])
}
