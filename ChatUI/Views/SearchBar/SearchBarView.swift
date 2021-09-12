//
//  SearchBarView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/10/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @Binding  var isEditing: Bool
    @Binding  var isLoading: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            Color.gray
                .frame(width: Constants.screenSize.width , height: 37)
                .cornerRadius(8)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                TextField("Search...", text: $text)
                    .padding(7)
                    .background(Color.gray)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .onTapGesture(perform: {
                        isEditing = true
                    })
                    .animation(.default)
                if !text.isEmpty {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(1)
                    } else {
                        ImageBtn(imageName: "xmark.circle", foregroundColor: .white, fontSize: .system(size: 10)) {
                            text = ""
                            isLoading = false
                        }
                        .animation(.default)
                    }
                }
                if isEditing {
                    Button(action: {
                        isEditing = false
                        isLoading = false
                        hideKeyboard()
                    }, label: {
                        Text("Cancel")
                    })
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                    .foregroundColor(.white)
                    .padding(.horizontal, 6)
                }
            }
        }
    }
    
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), isEditing: .constant(false), isLoading: .constant(false))
    }
}


