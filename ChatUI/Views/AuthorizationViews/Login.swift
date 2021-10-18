//
//  Login.swift
//  ChatUI
//
//  Created by Leandro A diaz R on 9/6/21.
//

import SwiftUI
import AuthenticationServices

struct Login: View {
    @State private var showView = false
    @State var emailAddress: String = ""
    @State var password: String = ""
    //    @State var hidden: Bool = true
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        //MARK:-MainStack
        
        NavigationView {
            VStack(spacing: 50) {
                //MARK:- Images and Top Title
                ZStack() {
                    Color.white
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Image(Images.topBackground)
                            .resizable()
                            .frame(width: Constants.screenSize.width, height: Constants.screenSize.height / 4, alignment: .top)
                    }
                    
                    
                    //MARK:-Logo image
                    Image(systemName: Images.bubbleImage)
                        .resizable()
                        .frame(width: 120, height: 100, alignment: .center)
                        .foregroundColor(.green)
                        .offset(y: 70)
                    Image(Images.startsYellow)
                        .padding(.top, 100)
                }
                .padding(.top, -150)
                
                
                //MARK:- WELCOME TITLE
                CustomTitle(message: "Welcome")
                
                
                //MARK:- TEXT FIELDS
                VStack(alignment: .leading)  {
                    CustomFieldWithBorder(title: "EMAIL ADDRESS", placeholder: "email address", target: $emailAddress)
                    PasswordField(message: "Password", password: $password)
                    Divider()
                        .frame(width: Constants.screenSize.width / 1.1, height: 5)
                        .background(Color.green)
                }
                .padding()
                .frame(width: Constants.screenSize.width)
                .font(.title3)
                .foregroundColor(Color.init(.systemGray2))
                
                
                HStack {
                    Text("Don't have an account...?")
                    Button("Click here to Sign Up") {
                        showView.toggle()
                    }
                    .fullScreenCover(isPresented: $showView, content: {
                        SignUp()
                    })
                    .foregroundColor(.blue)
                }
                .padding(.top,-50)
                
                
                //MARK:- forgot password button
                //                if !hidden {
                NavigationLink(
                    destination: Text("Forgot pass"),
                    label: {
                        Text("Forgot password")
                            .font(.footnote)
                            .foregroundColor(.red)
                    })
                    .frame(height: 20, alignment: .center)
                    .padding(-50)
                //                }
                
                
                
                //MARK:- ACTION BUTTONS
                VStack(spacing: 10) {
                    
                    //MARK:-Sign in Button
                    CustomSignInButton(imageName: "person", message: "Continue with Email", gradientColorOne: .gray, gradientColorTwo: .green, action: {
                        //
                        authVM.login()
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
                Spacer()
            }//End MainStack
            
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}



struct CustomFieldWithBorder: View {
    var title: String
    var placeholder: String
    @Binding var target: String
    var body: some View {
        VStack {
            Text(title.uppercased())
                .bold()
            TextField("Enter your \(placeholder)", text: $target)
                .frame(width: Constants.screenSize.width / 1.1)
            Divider()
                .frame(width: Constants.screenSize.width / 1.1, height: 5)
                .background(Color.green)
        }
        .multilineTextAlignment(.leading)
    }
}











