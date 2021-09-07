//
//  SettingsHeaderView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/7/21.
//

import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        
        HStack {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                .padding()
            VStack(alignment: .leading, spacing: 4) {
                Text("Leandro diaz ")
                    .font(.title3)
                    .bold()
                
                Text("status")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
            }
            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 90)
        .background(Color.white)
    }
}

struct SettingsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHeaderView()
    }
}
