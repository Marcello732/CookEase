//
//  FavouritesView.swift
//  CookEase
//
//  Created by Marcel Bączyński on 23/08/2024.
//

import SwiftUI

struct FavouritesView: View {
    @Environment(ModelData.self) var modelData
    var recipes: [Recipe]
    
    func filteredRecipes(for category: String) -> [Recipe] {
        return recipes.filter { $0.category.rawValue == category && $0.isFavorite }
        }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationView {
            ScrollView {
                VStack {
                    RecipeRow(items: filteredRecipes(for: "Pasta"), header: "Pasta")
                    .navigationTitle("Discover")
                    
                    Spacer()
                    
                    RecipeRow(items: filteredRecipes(for: "Burger"), header: "Burger")
                    
                    Spacer()
                    
                    RecipeRow(items: filteredRecipes(for: "Pizza"), header: "Pizza")
                    
                    Spacer()
                    
                    RecipeRow(items: filteredRecipes(for: "Salad"), header: "Salad")
                    
                    Spacer()
                    
                    RecipeRow(items: filteredRecipes(for: "Soup"), header: "Soup")
                }
            }
                
        }
    }
}

#Preview {
    let modelData = ModelData()
    return FavouritesView(recipes: modelData.recipes)
        .environment(modelData)
}
