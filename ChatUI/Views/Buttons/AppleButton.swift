//
//  AppleButton.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI
import AuthenticationServices

struct AppleButton: View {
    @Binding var fullName: String
    @Binding var emailAddress: String
    var body: some View {
        Group{
            SignInWithAppleButton(.signIn) { request in
                //                    request.reqestedScopes = [.fullName, .email]
            } onCompletion: { result in
                //                    switch result {
                //                        case .success(let authResults):
                //                            print("Authorisation successful")
                //                        case .error(let error):
                //                            print("Authorisation failed: \(error.localizedDescription)")
            }
            .font(.title3)
            .signInWithAppleButtonStyle(.black)
            .frame(width: 150, height: 40, alignment: .center)
            .shadow(color: .gray, radius: 5.0, x: 0.0, y: 0.0)
        }
    }
}

struct AppleButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleButton(fullName: .constant(""), emailAddress: .constant(""))
    }
}
