//
//  ChatUIApp.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI
import Firebase

@main
struct ChatUIApp: App {
    @StateObject var authentication = Authentication()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if authentication.isValidated {
//            SignUp()
                            TabBarView()
                    .environmentObject(authentication)
            } else {
                Login()
                    .environmentObject(authentication)
            }
        }
    }
}
