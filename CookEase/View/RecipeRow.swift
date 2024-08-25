//
//  RecipeList.swift
//  CookEase
//
//  Created by Marcel Bączyński on 24/08/2024.
//

import SwiftUI

struct RecipeRow: View {
    @Environment(ModelData.self) var modelData
    var items: [Recipe]
    var header: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(header)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                
                .padding(10)
                .padding(.leading, 10)
            ScrollView (.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(items) { recipe in
                            NavigationLink {
                                RecipeDetails(recipe: recipe)
                                
                            } label: {
                                RecipeCard(recipe: recipe)
                                    
                            }
                        }
                    }
            }
        }
        }
    
}

#Preview {
    RecipeRow(items: ModelData().recipes, header: "Pasta").environment(ModelData())
}
