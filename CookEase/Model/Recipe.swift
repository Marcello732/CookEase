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
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case pasta = "Pasta"
        case burger = "Burger"
        case pizza = "Pizza"
        case salad = "Salad"
        case soup = "Soup"
    }
    
    init(id: Int, name: String, tags: String, time: Int, difficulty: String, ratings: Double, isFavorite: Bool, description: String, author: String, imageName: String, category: String) {
        self.id = id
        self.name = name
        self.tags = tags
        self.time = time
        self.ratings = ratings
        self.isFavorite = isFavorite
        self.description = description
        self.author = author
        self.imageName = imageName
        
        switch difficulty.lowercased() {
        case "easy":
            self.difficulty = .easy
        case "medium":
            self.difficulty = .medium
        case "hard":
            self.difficulty = .hard
        default:
            self.difficulty = .easy // Default to easy if something unexpected happens
        }
        
        switch category.lowercased() {
        case "pasta":
            self.category = .pasta
        case "burger":
            self.category = .burger
        case "pizza":
            self.category = .pizza
        case "salad":
            self.category = .salad
        case "soup":
            self.category = .soup
        default:
            self.category = .pasta // Default to easy if something unexpected happens
        }
    }
}
