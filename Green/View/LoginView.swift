//
//  LoginView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/28/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                
                VStack(spacing: 30) {
                    SignInAndSignUpView()
                    SignInWithSocialAccounts()
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 30)
        .animation(.easeInOut)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct SignInAndSignUpView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Picker("Login", selection: $selection) {
                Text("Log in").tag(0)
                Text("Sign up").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if selection == 0 {
                SignInView()
            } else {
                SignUpSectionView()
            }
        }
    }
}

struct SignInWithSocialAccounts: View {
    private let socialLogin = SocialLogin()
    
    var body: some View {
        VStack(spacing: 30) {
            Divider()
            Text("Or sign in with")
                .foregroundColor(Color.secondary)
            VStack(spacing:20) {
                Button(action: self.loginWithApple) {
                    Text("Login with Apple")
                }
                
                Button(action: self.socialLogin.attemptLoginGoogle) {
                    HStack {
                        Image("glogo")
                            .resizable()
                            .scaledToFit()
                            .padding(.all, 8)
                        Text("Login with Google")
                    }
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                    .cornerRadius(8)
                }
            }
        }
    }
    
    func loginWithApple() {
        print("some")
    }
}

struct SignInView: View {
    @EnvironmentObject var session: SessionStore
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var error: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    TextField("Email address", text: $email)
                        .keyboardType(.emailAddress)
                }
                Divider()
            }
            VStack {
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    SecureField("Password", text: $password)
                }
                Divider()
            }
            
            Button(action: signIn) {
                Text("Go")
                    .font(.system(size: 22))
                    .bold()
                    .frame(height: 50)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .cornerRadius(8)
                    .foregroundColor(Color.white)
            }
            
            if error != "" {
                Text(error)
                    .foregroundColor(Color.red)
            }
        }
    }
    
    private func signIn() {
        print("Sign in pressed")
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
            self.password = ""
        }
    }
}

struct SignUpSectionView: View {
    @EnvironmentObject var session: SessionStore
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var error: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    TextField("Email address", text: $email)
                        .keyboardType(.emailAddress)
                }
                Divider()
            }
            VStack {
                HStack(spacing: 15) {
                    Image(systemName: "lock")
                        .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    SecureField("Password", text: $password)
                }
                Divider()
            }
            VStack {
                HStack {
                    Image(systemName: "lock.shield")
                        .foregroundColor(Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)))
                    SecureField("Confirm password", text: $confirmPassword)
                }
                Divider()
            }
            
            Button(action: signUp) {
                Text("Sign up")
                    .font(.system(size: 22))
                    .bold()
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                    .cornerRadius(8)
            }
            
            if error != "" {
                Text(error)
                    .foregroundColor(Color.red)
            }
        }
    }
    
    private func signUp() {
        print("Sign up pressed")
        
        if password != confirmPassword {
            self.error = "password did not match"
            self.password = ""
            self.confirmPassword = ""
            return
        }
        
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
                return
            } else {
                self.email = ""
                self.password = ""
                self.confirmPassword = ""
            }
            self.password = ""
            self.confirmPassword = ""
        }
    }
}
