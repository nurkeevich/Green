//
//  SubSelectionsView.swift
//  Green
//
//  Created by tilekbek kadyrov on 6/4/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct SubSelectionsView: View {
    var image: String
    var name: String
    @State private var changeBackgroundColor: Bool = false
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 65, height: 65)
                .scaledToFit()
                .background(self.changeBackgroundColor ? Color.green : Color.white)
                .cornerRadius(8)
                .onTapGesture { self.changeBackgroundColor.toggle() }
            Text(name)
                .font(.caption)
                .foregroundColor(Color.secondary)
        }
    }
}

//struct SubSelectionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubSelectionsView()
//    }
//}
