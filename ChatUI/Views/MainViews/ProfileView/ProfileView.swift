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
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage = Image(systemName: "person")
    
    private func loadSelectedImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)  
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    
                    //MARK:- PROFILE IMAGE, EDIT, DESCRIPTION
                    HStack{
                        //MARK:- PROFILE IMAGE
                        VStack {
                            ProfileImageView(imageName: profileImage)
                                .frame(width: 90, height: 90, alignment: .center)
                                .border(Color.black, width: 1)
                            
                            //MARK:- EDIT BUTTON
                            Button(action: {
                                showImagePicker.toggle()
                            }, label: {
                                Text("Edit")
                                    .bold()
                            })
                            .sheet(isPresented: $showImagePicker, onDismiss: loadSelectedImage, content: {
                                SwiftUIImagePicker(image: $selectedImage)
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
//                                                .bold()
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

