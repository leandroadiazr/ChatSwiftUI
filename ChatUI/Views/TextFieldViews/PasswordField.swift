//
//  PasswordField.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI

struct PasswordField: View {
    var message: String
    @Binding var password: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(message.uppercased())
                .font(.subheadline)
//                .bold()
            SecureField("Enter your password", text: $password)
//                .frame(width: Constants.screenSize.width / 1.1, height: 40, alignment: .center)
           
        }
    }
}


