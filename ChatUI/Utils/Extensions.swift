//
//  Extensions.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/12/21.
//

import SwiftUI


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
