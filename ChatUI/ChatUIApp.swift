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
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel(userManager: UsersManager(), storageManager: StorageManager(), userSession: Auth.auth()))
//            TabBarView()
        }
    }
}
