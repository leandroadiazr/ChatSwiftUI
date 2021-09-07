//
//  SettingsViewCell.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/7/21.
//

import SwiftUI

struct SettingsViewCell: View {
    let viewModel: SettingsCellViewModel
//    var imageName: String = ""
//    var title: String = ""
//    var backgroundColor = Color.white
    
    
    var body: some View {
        VStack {
            HStack {
                //Image
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .padding(6).background(viewModel.backgroundColor)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                //name
                
                Text(viewModel.title)
                    .font(.title3)
                
                Spacer()
                
                //arrow
                ImageBtn(imageName: "chevron.right", foregroundColor: .gray, fontSize: .body) {
                    
                }
                .padding(.horizontal, 6)
            }
            .background(Color.white)
            .padding()
            Divider()
                .frame(width: Constants.screenSize.width, height: 1)
                .background(Color.gray)
        }
    }
}

struct SettingsViewCell_Previews: PreviewProvider {
    static var previews: some View {
//        SettingsViewCell()
        EmptyView()
    }
}
