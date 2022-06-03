//
//  Authentication.swift
//  ChatUI
//
//  Created by LeandroDiaz on 1/17/22.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
        
    }
}


