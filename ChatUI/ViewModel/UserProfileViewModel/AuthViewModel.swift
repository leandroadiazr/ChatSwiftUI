//
//  AuthViewModel.swift
//  ChatUI
//
//  Created by Leandro Diaz on 10/10/21.
//

import Foundation
import Firebase


class AuthViewModel: ObservableObject {
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    
    var service = Service.shared
    let auth = Auth.auth()
    let userManager = UsersManager()
    
    var loginDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        showProgressView = true
        service.login(credentials: credentials) { [unowned self] (result: Result<Bool, Service.APIError>) in
//            guard let self = self else { return }
            showProgressView = false
            
            switch result {
            case .success:
                completion(true)
            case .failure:
                credentials = Credentials()
            }
            
        }
        print("login now")
    }
    
    func register(email: String, name: String, password: String, passwordTwo: String) {
        print("registering now \(email), \(name), \(password), \(passwordTwo), ")
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("failed to register \(error.localizedDescription)")
                return
            }

            guard let data = result?.user else { return }
            let newUser = UserProfile(userID: data.uid, name: name, handler: "@\(name)", email: email, profileImage: "asdf", userLocation: "asdf", userBio: "asdf", userStatus: "asdf")
            self.userManager.createUserWith(user: newUser)
            

        }
        
    }
    
    func signOut() {
        print("signing out now")
    }
}
