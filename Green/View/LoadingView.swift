//
//  LoadingView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/29/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading3")
                .frame(width: 250, height: 250)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
