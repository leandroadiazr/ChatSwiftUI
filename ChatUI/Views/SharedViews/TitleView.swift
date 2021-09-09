//
//  TitleView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI

struct CustomTitle: View {
    var message: String
    var body: some View {
        Text(message)
            .bold()
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
