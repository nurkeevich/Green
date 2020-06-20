//
//  SignInAndSignUpView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/29/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

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

struct SignInAndSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignInAndSignUpView()
    }
}
