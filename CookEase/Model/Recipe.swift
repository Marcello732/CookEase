//
//  RecipeModel.swift
//  CookEase
//
//  Created by Marcel Bączyński on 24/08/2024.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var tags: String
    var time: Int
    var difficulty: Difficulty
    enum Difficulty: String, CaseIterable, Codable {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
    }
    
    var ratings: Double
    var isFavorite: Bool
    var description: String
    var author: String

    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
