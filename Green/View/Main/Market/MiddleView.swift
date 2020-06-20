//
//  MiddleView.swift
//  Green
//
//  Created by tilekbek kadyrov on 6/4/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct MiddleView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
            VStack {
                Image("lemon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/3, height: 100)
                VStack(alignment: .leading, spacing: 15) {
                    Text("Lemon")
                        .font(.headline)
                    Text("Bergamo Italy")
                        .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    Text("$1.15")
                        .foregroundColor(Color.green)
                        .font(.headline)
                }
            }
            .padding(.all, 5)
            .background(Color.white)
            .cornerRadius(8)
    }
    
}

struct MiddleView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleView()
    }
}
