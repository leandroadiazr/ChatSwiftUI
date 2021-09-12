//
//  CustomSearchBarView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/12/21.
//

import SwiftUI

struct CustomSearchBarView: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            TextField("Search....", text: $text)
                .font(.system(size: 18, weight: .semibold))
                .padding(8)
                .padding(.horizontal, 34)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .overlay(
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                )
            
            if isEditing {
                Button("Cancel") {
                    isEditing = false
                    text = ""
                    //dismissKeyboard
                    hideKeyboard()
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
        }
    }
}

struct CustomSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBarView(text: .constant("Search..."), isEditing: .constant(false))
    }
}
