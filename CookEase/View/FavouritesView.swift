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
    
    var filteredRecipes: [Recipe] {
            recipes.filter { landmark in
                (landmark.isFavorite)
            }
        }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationView {
            ScrollView {
                VStack {
                    RecipeRow(items: filteredRecipes, header: "Pasta")
                    .navigationTitle("Favorites")
                    
                    Spacer()
                    
                    RecipeRow(items: filteredRecipes, header: "Burger")
                    
                    Spacer()
                    
                    RecipeRow(items: filteredRecipes, header: "Pizza")
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
