//
//  ContentView.swift
//  CookEase
//
//  Created by Marcel Bączyński on 23/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .discover
    @Environment(ModelData.self) var modelData

        enum Tab {
            case discover
            case search
            case add
            case favourites
            case profile
        }
    
    var body: some View {
        TabView(selection: $selection) {
                    
            DiscoverView(recipes: modelData.recipes)
                .tabItem {
                    Label("Discover", systemImage: "house")
                }
                .tag(Tab.discover)
                    
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
                    
            AddView()
                .tabItem {
                    Label("Add", systemImage: "plus")

                }
                .tag(Tab.add)
            
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "heart")

                }
                .tag(Tab.favourites)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")

                }
                .tag(Tab.profile)
                }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
