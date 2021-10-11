//
//  AuthViewModel.swift
//  ChatUI
//
//  Created by Leandro Diaz on 10/10/21.
//

import Foundation
import Firebase
import UIKit
import SwiftUI


class AuthViewModel: ObservableObject {
    let storageManager = StorageManager()
    let auth = Auth.auth()
    let userManager = UsersManager()
    
    func login() {
        print("login now")
    }
    
    func register(email: String, name: String, password: String, passwordTwo: String, userProfileImage: UIImage) {
        print("registering now \(email), \(name), \(password), \(passwordTwo), ")
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("failed to register \(error.localizedDescription)")
                return
            }
            
            guard let data = result?.user else { return }
            
            self.storageManager.uploadSingleImage(userProfileImage) { imageUrl in 
                let newUser = UserProfile(userID: data.uid, name: name, handler: "@\(name)", email: email, profileImage: imageUrl, userLocation: "asdf", userBio: "asdf", userStatus: "asdf")
                self.userManager.createUserWith(user: newUser)
            }
        }
        
    }
    
    func signOut() {
        print("signing out now")
    }
}
