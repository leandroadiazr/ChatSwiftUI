//
//  SettingsView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/7/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 60) {
                //MARK:- HEADER
                NavigationLink(
                    destination: ProfileView(),
                    label: {
                        SettingsHeaderView()
                    })
                

                VStack {
                    ForEach(SettingsCellViewModel.allCases, id: \.self) { item in
                        SettingsViewCell(viewModel: item)
                    }
                }
                .background(Color.white)
                .padding(.horizontal)
                
                ImageBtn(imageName: "", foregroundColor: .red, title: "Log Out", fontSize: .headline, backgroundColor: .white) {
                    //action
                    authentication.updateValidation(success: false)
                    
                }
            }
            //            .padding()
            Spacer()
        }
        //        .padding()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


