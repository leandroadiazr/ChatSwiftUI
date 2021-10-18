//
//  SignUp.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI
import AuthenticationServices

struct SignUp: View {
    @State private var showView = false
    @State var name: String = ""
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var passwordTwo: String = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var authVM: AuthViewModel
    @State var isHidden: Bool = true
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image? //  = Image(systemName: "person")
    @ObservedObject var userManager = UsersManager()
    
    
    var body: some View {
        //MARK:-MainStack
         
        ZStack {
            NavigationView {
                VStack(spacing: 50) {
                    //MARK:- Images and Top Title
                    ZStack {
                        Color.white
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Image(Images.topBackground)
                                .resizable()
                                .frame(width: Constants.screenSize.width, height: Constants.screenSize.height / 4, alignment: .top)
                        }
                        
                        
                        //MARK:-Logo || Profile image || Button
                        UserProfileImageSelector(imagePickerPresented: $imagePickerPresented, profileImage: $profileImage, selectedImage: $selectedImage, action: {
                            imagePickerPresented.toggle()
               
                           return print("selecting profile image")
                        })
                    }
                    .padding(.top, -100)
                    
                    
                    //MARK:- WELCOME TITLE
                    VStack {
                        CustomTitle(message: "Join Connect, It's Easy...!")
                    }
                    .padding(.top, -80)
                    
                    
                    //MARK:- TEXT FIELDS
                    
                    VStack(alignment: .leading) {
                        CustomFieldWithBorder(title: "", placeholder: "name", target: $name)
                        CustomFieldWithBorder(title: "", placeholder: "email address", target: $emailAddress)
                        
                    }
                    .font(.title3)
                    .frame(height: 50, alignment: .center)
                    .foregroundColor(Color.init(.systemGray2))
                    
                    HStack {
                        PasswordField(message: "Password", password: $password)
                            .frame(width: Constants.screenSize.width / 2.5)
                        PasswordField(message: "Retype Password", password: $passwordTwo)
                            .frame(width: Constants.screenSize.width / 2.5)
                        
                    }
//                    .frame(width: Constants.screenSize.width)
                    .font(.body)
                    .padding(.horizontal, 1)
                    VStack {
                        Divider()
                            .frame(width: Constants.screenSize.width / 1.1, height: 5)
                            .background(Color.green)
                    }
                    .padding(.top,-40)
                    
                    
                    
                    HStack {
                        Text("Already have an account...?")
                        Button("Click here to Login") {
                            showView.toggle()
                        }
                        .fullScreenCover(isPresented: $showView, content: {
                            Login()
                        })
                        .foregroundColor(.blue)
                    }
                    .padding(.top,-75)
                    
                    
                    
                    //MARK:- forgot password button
                    if !isHidden {
                        VStack {
                            NavigationLink(
                                destination: Text("Forgot pass"),
                                label: {
                                    Text("Forgot password")
                                        .font(.footnote)
                                        .foregroundColor(.red)
                                })
                                .frame(height: 10, alignment: .center)
                        }
                        .padding(.top, -60)
                    }
                    
                    
                    
                    //MARK:- ACTION BUTTONS
                    VStack(spacing: 10) {
                        
                        //MARK:-registration Button
                        CustomSignInButton(imageName: "envelope", message: "Continue with Email", gradientColorOne: .gray, gradientColorTwo: .green, action: {
                            //registration
                            guard !name.isEmpty, !emailAddress.isEmpty, !password.isEmpty, !passwordTwo.isEmpty else {
                                print("empty")
                                return isHidden = false
                            }
                            
                            guard let profileImage = selectedImage else {
                                return print("select image to upload i")
                            }
                            
                            
                            authVM.register(email: emailAddress, name: name, password: password, passwordTwo: passwordTwo, userProfileImage: profileImage)
                            
                            return print("sucess")
                        })
                        
                        //MARK:- Apple Button
                        AppleButton(fullName: .constant(""), emailAddress: $emailAddress)
                        
                        //MARK:-FACEBOOK BUTTON
                        CustomSignInButton(imageName: "person", message: "Continue with Facebook", gradientColorOne: .gray, gradientColorTwo: .blue) {
                            //
                        }
                        // MARK:-  GOOGLE BUTTON
                        CustomSignInButton(imageName: "person", message: "Continue with Google", gradientColorOne: .gray, gradientColorTwo: .red) {
                            //
                        }
                        
                        Spacer()
                        
                    }
                    .padding(.top, -50)
                    //                Spacer()
                }//End MainStack
                .padding(.top, -95)
                
            }
            .navigationBarBackButtonHidden(true)
            NavigationLink (
                destination: HomeView(),
                isActive: $userManager.didAuthenticate,
                label: {}
            )
        }
    }
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

