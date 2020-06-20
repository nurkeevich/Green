//
//  MainTabView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/31/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct MainTabView: View {
    @State private var selected: Int = 0
    
    var body: some View {
        TabView(selection: $selected) {
            FavoritesView()
                .tabItem { Image(systemName: selected == 2 ? "heart.fill" : "heart"); Text("Favorites") }
                .tag(2)
            ShoppingListView()
                .tabItem { Image(systemName: selected == 3 ? "doc.text.fill" : "doc.text"); Text("Shopping list") }
                .tag(3)
            MarketView()
                .tabItem { Image(systemName: selected == 0 ? "house.fill" : "house"); Text("Market") }
                .tag(0)
            CouponsView()
                .tabItem { Image(systemName: selected == 1 ? "tag.fill" : "tag"); Text("Coupons") }
                .tag(1)
            ShoppingCardView()
                .tabItem {Image(systemName: selected == 4 ? "cart.fill" : "cart"); Text("Cart")}
                .tag(4)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
