//
//  MessagesView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/10/21.
//

import SwiftUI

struct NewMessagesView: View {

    
    
    var body: some View {
        VStack {
//            SearchBarView(text: $searchMessage, isLoading: .constant(false))
            
            
            
            UserCell()
        }
    }
}

struct NewMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessagesView()
    }
}
