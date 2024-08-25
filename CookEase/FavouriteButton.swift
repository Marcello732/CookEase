//
//  FavouriteButton.swift
//  CookEase
//
//  Created by Marcel Bączyński on 25/08/2024.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .font(.title2)
                .foregroundStyle(isSet ? Color.accentColor : Color.first)
        })
        .frame(width: 47, height: 47)
        .background(Color.second)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
