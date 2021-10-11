//
//  UsersManager.swift
//  ChatUI
//
//  Created by Leandro Diaz on 10/10/21.
//

import Foundation
import Firebase

class UsersManager: ObservableObject {
    @Published var didAuthenticate = false
    let firestore = Firestore.firestore().collection("users")
    func createUserWith(user: UserProfile) {
        
        print(user)
        firestore.document(user.userID).setData(user.userDictionary) { error in
            if let _ = error {
                print(error?.localizedDescription ?? "")
            }
            self.didAuthenticate = true
            print("Suscessfully Created Database User \(user.name)")
        }
    }
    
}
