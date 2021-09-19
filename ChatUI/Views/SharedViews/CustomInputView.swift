//
//  CustomInputView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/19/21.
//

import SwiftUI

struct CustomInputView: View {
    @Binding var inputText: String
    var action: () -> Void?
    
    var body: some View {
        VStack {
            Divider()
                .background(Color.black)
            HStack {
                TextField("Message...", text: $inputText)
                    .frame(minHeight: 35)
                    .padding(.horizontal, 5)
                Button(action: {
                    action()
                }, label: {
                    Text("Send")
                        .fontWeight(.heavy)
                })
                
                .padding(.trailing, 8)
                
            }
            .padding(.horizontal, 8)
        }
        
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(inputText: .constant(""), action: {
            //
        })
    }
}
