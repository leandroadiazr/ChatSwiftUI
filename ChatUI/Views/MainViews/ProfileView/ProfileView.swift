//
//  ProfileView.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/8/21.
//

import SwiftUI

struct ProfileView: View {
    @State private var fullName: String = ""
    @ObservedObject var viewModel = StatusChanged()
    
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    
                    //MARK:- PROFILE IMAGE, EDIT, DESCRIPTION
                    HStack{
                        VStack {
                            ProfileImageView(imageName: "person")
                                .frame(width: 90, height: 90, alignment: .center)
                                .border(Color.black, width: 1)
                            Button(action: {
                                
                            }, label: {
                                Text("Edit")
                                    .bold()
                            })
                        }
                        Text("Enter your name and add an optional profile picture")
                            .font(.footnote)
                    }
                    .padding(.top)
                    
                    Divider()
                        .background(Color.red)
                    
                    //MARK:- NAME
                    VStack(alignment: .leading) {
                        TextField("name", text: $fullName)
                            .padding(6)
                        Divider()
                            .background(Color.red)
                        
                        VStack(alignment: .leading) {
                            Text("Status")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        .padding(.top)
                        
                        HStack {
                            NavigationLink(
                                destination: StatusSelectorView(),
                                label: {
                                    StatusCell(status: viewModel.status)
                                    //        Text(viewModel.status.title)
                                    //            .bold()
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                })
                        }
                        .padding(.top, 5)
                    }
                }
                .padding(10)
                .background(Color.white)
                Spacer()
            }
            .padding(.top, 10)
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//struct ExtractedView: View {
//    var body: some View {

//    }
//}
