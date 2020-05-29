//
//  ContentView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/28/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Group {
            if session.user != nil {
                TabView()
            } else {
                LoginView()
            }
        }.onAppear(perform: getUser)
    }
    
    func getUser() {
        session.listen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
