//
//  Network.swift
//  CodingExercise
//
//  Created by AnanyaK on 4/20/24.
//

import Foundation
protocol Network {
    func getDessertData() async -> Result<Dessert,Failure>
    func getMealDetails(mealId: String) async -> Result<Details, Failure>
}

enum Failure: Error {
    case invalidURL
    case invalidData
}


class NetworkService: Network {
    func getDessertData() async -> Result<Dessert,Failure> {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return Result.failure(.invalidURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let model = try JSONDecoder().decode(Dessert.self, from: data)
            return Result.success(model)
        } catch {
            return Result.failure(.invalidData)
        }
    }
    
    func getMealDetails(mealId: String) async -> Result<Details, Failure> {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)") else {
            return Result.failure(.invalidURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let model = try JSONDecoder().decode(Details.self, from: data)
            return Result.success(model)
        } catch {
            return Result.failure(.invalidData)
        }
    }
}
