//
//  LocalService.swift
//  ChatUI
//
//  Created by LeandroDiaz on 1/17/22.
//

import Foundation


class Service {
    static let shared = Service()
    enum APIError: Error {
        case error
    }

    
    func login(credentials: Credentials, completion: @escaping (Result<Bool, APIError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.error))
            }
        }
    }

}
