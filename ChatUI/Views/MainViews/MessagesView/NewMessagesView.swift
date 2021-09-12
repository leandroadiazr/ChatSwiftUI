//
//  MessagesView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/10/21.
//

import SwiftUI

struct NewMessagesView: View {
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    @State private var searchText = ""
    @State private var isEditing = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                CustomSearchBarView(text: $searchText, isEditing: $isEditing)
                    .onTapGesture {
                        isEditing.toggle()
                    }
                    .padding()
                
                ForEach(0 ... 10, id: \.self) { userCell in
                    Button(action: {
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    }, label: {
                        UserCell()
                    })
 
                }
                .foregroundColor(.black)
                
            }
 
        }
    }
}

struct NewMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessagesView(showChatView: .constant(true))
    }
}
