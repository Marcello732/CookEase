//
//  RecipesRow.swift
//  CookEase
//
//  Created by Marcel Bączyński on 24/08/2024.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            recipe.image
                .resizable()
                .scaledToFill()
                .frame(width: 282, height: 343)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .clipped()
            VStack {
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.mint)
                        Text(String(recipe.ratings))
                            .foregroundStyle(Color.mint)
                    }
                    .padding(8)
                    .background(Color.second)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .padding([.top, .trailing], 10)
                }
                Spacer()
                HStack {
                    VStack {
                        Text(recipe.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color.first)
                            .font(.system(size: 24))
                        HStack {
                            Text(recipe.tags)
//                            Text("#glutenfree")
                        }
                        .foregroundStyle(Color.mint)
                    }
                    .padding(.horizontal, 12)
                    
                    Spacer()
                                        
                    Image(systemName: "heart")
                        .font(.system(size: 24))
                        .foregroundStyle(Color.mint)
                        .padding(.horizontal, 12)
                }
                .padding(10)
                .background(Color.second)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .frame(width: 263, height: 65)
                .padding([.leading, .trailing, .bottom], 10)
            }
        }
        .frame(width: 282, height: 343)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .padding(10)
        .padding(.leading, 10)
    }
    
}

#Preview {
    RecipeCard(recipe: recipes[0])
}
