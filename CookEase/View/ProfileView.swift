//
//  FavouritesView.swift
//  CookEase
//
//  Created by Marcel Bączyński on 23/08/2024.
//

import SwiftUI

struct ProfileView: View {
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
                    HStack {
                        Spacer()
                        Image("profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Spacer()
                        VStack(alignment: .center) {
                            Text("10")
                                .font(.title2)
                                .bold()
                            Text("recipes")
                        }
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Text("150")
                                .font(.title2)
                                .bold()
                            Text("followers")
                        }
                        Spacer()
                        
                        VStack(alignment: .center) {
                            Text("342")
                                .font(.title2)
                                .bold()
                            Text("following")
                        }
                        Spacer()
                    }.padding(.top, 12)
                    
                    Text("🌍 Food Enthusiast | 🍕 Pizza Lover | 🍝 Pasta Aficionado 🍳 Home Chef Sharing My Favorite Recipes ✨ Cooking Up Comfort Food & Global Flavors 📸 Capturing Culinary Creations | 📍 NYC 👇 Check out my latest dish!")
                        .font(.callout)
                        .padding(.horizontal, 24)
                        .padding(.top, 12)
                    
                    RecipeRow(items: filteredRecipes, header: "Your recipes")
                    .navigationTitle("Hi, Oscar!")
                }
            }
                
        }
    }
}

#Preview {
    let modelData = ModelData()
    return ProfileView(recipes: modelData.recipes)
        .environment(modelData)
}
