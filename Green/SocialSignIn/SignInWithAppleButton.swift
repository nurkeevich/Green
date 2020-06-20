//
//  SignInWithAppleButton.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/29/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
        
    }
}
