//
//  DiscoverView.swift
//  CookEase
//
//  Created by Marcel Bączyński on 23/08/2024.
//

import SwiftUI

struct DiscoverView: View {
    @Environment(ModelData.self) var modelData
    var recipes: [Recipe]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    RecipeRow(items: recipes, header: "Pasta")
                    .navigationTitle("Discover")
                    
                    Spacer()
                    
                    RecipeRow(items: recipes, header: "Burger")
                    
                    Spacer()
                    
                    RecipeRow(items: recipes, header: "Pizza")
                }
            }
                
        }
    }
    }

#Preview {
    let modelData = ModelData()
    return DiscoverView(recipes: modelData.recipes)
        .environment(modelData)
}
