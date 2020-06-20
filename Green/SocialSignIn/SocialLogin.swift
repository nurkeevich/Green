//
//  SocialLogin.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/28/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI
import GoogleSignIn

struct SocialLogin: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SocialLogin>) -> UIView {
        return UIView()
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialLogin>) {
    }

    func attemptLoginGoogle() {
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance()?.signIn()
    }
}
