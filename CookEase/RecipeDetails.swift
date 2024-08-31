//
//  RecipeDetails.swift
//  CookEase
//
//  Created by Marcel Bączyński on 24/08/2024.
//

import SwiftUI

struct RecipeDetails: View {
    @Environment(ModelData.self) var modelData
    var recipe: Recipe
    
    var recipeIndex: Int {
            modelData.recipes.firstIndex(where: { $0.id == recipe.id })!
        }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
            VStack(alignment: .leading) {
                ZStack {
                    TabView {
                        recipe.image
                            .resizable()
                            .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius:22))
                        Image("pasta")
                            .resizable()
                            .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius:22))
                    }
                    .tabViewStyle(.page)
                    
//
                    
                    FavouriteButton(isSet: $modelData.recipes[recipeIndex].isFavorite)
                        .position(x: UIScreen.main.bounds.width - 50, y: 390)
                }
                .frame(height: 440, alignment: .trailing)
            }
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                
                Text(recipe.tags)
                    .foregroundStyle(Color.accentColor)
                    .font(.headline)
            }
            .padding(.horizontal, 6)
            
            HStack {
                Spacer()
                VStack {
                    Text("Time")
                        .font(.subheadline)
                        .bold()
                    Text(String(recipe.time)+" min")
                        .foregroundStyle(Color.accentColor)
                }
                Spacer()
                VStack {
                    Text("Difficulty")
                        .font(.subheadline)
                        .bold()
                    Text(recipe.difficulty.rawValue)
                        .foregroundStyle(Color.accentColor)
                }
                Spacer()
                VStack {
                    Text("Ratings")
                        .font(.subheadline)
                        .bold()
                    Text(String(recipe.ratings))
                        .foregroundStyle(Color.accentColor)
                }
                Spacer()
            }
            .padding(.top, 12)
            
            
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.title2)
                    .bold()
                Text(recipe.description)
                    .padding(.top, 6)
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading) {
                Text("Author")
                    .font(.title2)
                    .bold()
                HStack {
                    HStack {
                        Image(recipe.author)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        Text(recipe.author)
                    }
                    Spacer()
                    Button(action: {}, label: {
                        Text("Follow")
                    })
                    .padding()
                    .frame(width: 100, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 1) // inset value should be same as lineWidth in .stroke
                            .stroke(.accent, lineWidth: 1)
                    )
                    .padding(.trailing, 12)
                }
                .padding(6.0)
            }
            .padding(.top, 12)
            .padding(.horizontal, 30)
            .padding(.bottom, 100)
            
    }
        .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            // Your share action here
                        }) {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.title3)
                            })
                            .foregroundStyle(Color.accentColor)
//                            .frame(width: 40, height: 40)
//                            .background(Color.second)
//                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
//                            .position(x: UIScreen.main.bounds.width - 50, y: 70)
                        }
                    }
                }
        .ignoresSafeArea()
    }
}

#Preview {
    let modelData = ModelData()
    return RecipeDetails(recipe: modelData.recipes[0])
        .environment(modelData)
}
