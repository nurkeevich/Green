//
//  TabView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/28/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct TabView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack {
            Text("something here")
            Text(session.user!.uid)
            Button(action: session.signOut) { Text("Sign out") }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
