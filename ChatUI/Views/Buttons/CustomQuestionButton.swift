//
//  CustomQuestionButton.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI

struct CustomQuestionButton: View {
    var question: String
    var answer: String
    
    @Binding var emailAddress: String
    @Binding var password: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(question)
                .font(.body)
            NavigationLink(
                destination: SignUp(name: .constant(""), emailAddress: $emailAddress, password: $password, passwordTwo: .constant("")),
                label: {
                    Text(answer)
                })
        }
        .padding(.top, -50)
    }
}

