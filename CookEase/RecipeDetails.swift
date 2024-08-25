//
//  RecipeDetails.swift
//  CookEase
//
//  Created by Marcel Bączyński on 24/08/2024.
//

import SwiftUI

struct RecipeDetails: View {
    var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Image("pasta")
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius:22))
                    
                }.frame(width: 390, height: 440)
            }
            Spacer()
        }
    }
}

#Preview {
    RecipeDetails(recipe: recipes[0])
}
