//
//  SignUpSectionView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/29/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

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
                HStack(spacing: 15) {
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
                    .frame(height: 45)
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

struct SignUpSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSectionView()
    }
}
