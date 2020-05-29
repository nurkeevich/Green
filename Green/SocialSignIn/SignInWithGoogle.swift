//
//  SignInWithGoogle.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/28/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI
import GoogleSignIn

struct GoogleButton: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<GoogleButton>) -> GIDSignInButton {
        let button = GIDSignInButton()
        button.colorScheme = .dark
        button.style = .wide
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<GoogleButton>) {
        
    }
}
