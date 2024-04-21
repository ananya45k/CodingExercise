//
//  DetailsModel.swift
//  CodingExercise
//
//  Created by AnanyaK on 4/19/24.
//

import Foundation

struct Details: Codable {
    let meals: [MealDetails]
}

struct MealDetails: Codable {
    let meal: String
    let instructions: String
    
    enum CodingKeys: String, CodingKey {
        case meal = "strMeal"
        case instructions = "strInstructions"
    }
}
