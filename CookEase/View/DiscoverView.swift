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
    
    func filteredRecipes(for category: String) -> [Recipe] {
        return recipes.filter { $0.category.rawValue == category }
        }
    
    var body: some View {
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
    return DiscoverView(recipes: modelData.recipes)
        .environment(modelData)
}
