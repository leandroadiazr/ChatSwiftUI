//
//  CustomSignInButton.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI

struct CustomSignInButton: View {
    var imageName: String
    var message: String
    var gradientColorOne: Color
    var gradientColorTwo: Color
    
    var action: () -> ()
    
    var body: some View {
        Group{
            Button(action: {
                action()
            }, label: {
                Image(systemName: imageName)
                Text(message)
                    .font(.subheadline)
                    .bold()
            })
            .foregroundColor(.white)
            .frame(width: 150, height: 40, alignment: .center)
            .background(LinearGradient(gradient: Gradient(colors: [gradientColorOne, gradientColorTwo]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/) )
            .cornerRadius(8)
            .padding(2)
            .shadow(color: .gray, radius: 5.0, x: 0.0, y: 0.0)
        }
    }
}

struct CustomSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomSignInButton(imageName: "", message: "", gradientColorOne: .gray, gradientColorTwo: .gray, action: {
            //
        })
    }
}
