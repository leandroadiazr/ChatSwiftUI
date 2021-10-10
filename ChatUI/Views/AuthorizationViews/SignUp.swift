//
//  SignUp.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI
import AuthenticationServices

struct SignUp: View {
    @State var name: String = ""
    @State var emailAddress: String = ""
    @State var password: String = ""
    @State var passwordTwo: String = ""
    @Environment(\.presentationMode) var mode
    @ObservedObject var authVM = AuthViewModel()
    @State var isHidden: Bool = true
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image? //  = Image(systemName: "person")
    
    var body: some View {
        //MARK:-MainStack
        
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
                    UserProfileLogo(imagePickerPresented: $imagePickerPresented, profileImage: $profileImage, selectedImage: $selectedImage, action: {
                        imagePickerPresented.toggle()
           
                       return print("selecting profile image")
                    })
                }
                .padding(.top, -100)
                
                
                //MARK:- WELCOME TITLE
                VStack {
                    CustomTitle(message: "Join Connect, It's Easy...!")
                }
                .padding(-10)
                
                
                //MARK:- TEXT FIELDS
                VStack(alignment: .leading) {
                    CustomFieldWithBorder(title: "name", placeholder: "name", target: $name)
                    CustomFieldWithBorder(title: "email", placeholder: "email address", target: $emailAddress)
                    
                }
                .frame(height: 100, alignment: .center)
                .font(.title3)
                .foregroundColor(Color.init(.systemGray2))
                
                HStack {
                    PasswordField(message: "Password", password: $password)
                        .frame(width: Constants.screenSize.width / 2.5)
                    PasswordField(message: "Retype Password", password: $passwordTwo)
                        .frame(width: Constants.screenSize.width / 2.5)
                    
                }
                .frame(width: Constants.screenSize.width)
                .font(.body)
                .padding(.horizontal)
                VStack {
                    Divider()
                        .frame(width: Constants.screenSize.width / 1.1, height: 5)
                        .background(Color.green)
                }
                .padding(.top,-40)
                
                
                
                HStack {
                    Text("Already have an account...?")
                    NavigationLink(
                        destination: Login(emailAddress: emailAddress, password: password),
                        label: {
                            Text("Click here to Sign In")
                        })
                }
                .padding(.top,-70)
                
                
                
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
                        //                        guard name.isEmpty, emailAddress.isEmpty, password.isEmpty, passwordTwo.isEmpty else {
                        //                            return isHidden = false
                        //
                        //                        }
                        authVM.register(email: emailAddress, name: name, password: password, passwordTwo: passwordTwo)
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
            .padding(.top, -80)
        }
    }
    
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

struct UserProfileLogo: View {
    @Binding var imagePickerPresented: Bool
    @Binding var profileImage: Image?
    @Binding var selectedImage: UIImage?
    var action: () -> Void?
    
    private func loadSelectedImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    var body: some View {
        VStack {
            Image(Images.startsYellow)
                .padding(.top, 140)
            Button {
                //select image action
                action()
            } label: {
                
                if let profileImage = profileImage {
                ProfileImageView(imageName: profileImage, frameWidth: 120, frameHeight: 120)
                        .offset(y: -70)
                } else {
                    
                    Image(systemName: Images.bubbleImage)
                        .resizable()
                        .frame(width: 120, height: 100, alignment: .center)
                        .foregroundColor(.green)
                        .offset(y: -70)
                }
                
                
            }
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadSelectedImage) {
                SwiftUIImagePicker(image: $selectedImage)
            }
        }
    }
}
