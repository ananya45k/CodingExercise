//
//  DessertModel.swift
//  CodingExercise
//
//  Created by AnanyaK on 4/19/24.
//

import Foundation

struct Dessert: Codable{
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    let meal: String
    let mealThumb: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case meal = "strMeal"
        case mealThumb = "strMealThumb"
        case id = "idMeal"
    }
}
