//
//  MarketView.swift
//  Green
//
//  Created by tilekbek kadyrov on 5/31/20.
//  Copyright © 2020 tilekbek kadyrov. All rights reserved.
//

import SwiftUI

struct MarketView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.9411764706, blue: 0.9450980392, alpha: 1)).edgesIgnoringSafeArea(.all) //EFF0F1
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        SearchBarAndFilterView()
                        VStack {
                            AllCategoriesView(destination: Text("All Categories"), text: "All Categories")
                            SubSelectionScrollView()
                        }
                        VStack {
                            AllCategoriesView(destination: Text("Green Deals"), text: "Green Deals")
                            GreenDealsView()
                        }
                        
                        Button(action: {self.session.signOut()}) { Text("Logout") }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Market", displayMode: .inline)
        }
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView().environmentObject(SessionStore())
    }
}

struct GreenDealsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                MiddleView()
                MiddleView()
                MiddleView()
                MiddleView()
            }
        }
    }
}

struct AllCategoriesView: View {
    var destination: Text
    var text: String
    
    var body: some View {
        HStack {
            Text(text).bold()
            Spacer()
            NavigationLink(destination: destination) {
                HStack {
                    Text("View All")
                        .font(.footnote)
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
            }
        }
    }
}

struct SubSelectionScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(headerSelections, id: \.self) { selection in
                    SubSelectionsView(image: selection.image, name: selection.name)
                }
            }
        }
    }
}

struct HeaderSelection: Hashable {
    var image: String
    var name: String
}

var bakery = HeaderSelection(image: "bakery", name: "Bakery")
var fruits = HeaderSelection(image: "fruits", name: "Fruits")
var vegetables = HeaderSelection(image: "vegetables", name: "Vegetables")
var milk = HeaderSelection(image: "milk", name: "Milk")
var soda = HeaderSelection(image: "soda", name: "Soda")

var headerSelections = [bakery, fruits, vegetables, milk, soda]
