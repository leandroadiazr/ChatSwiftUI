//
//  UserCell.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/10/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0 ... 5, id: \.self) { user in
                    ConversationCell(userName: "Leandro Diaz", message: "@usernamee", timeStamp: "")
                    Divider()
                }
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
