//
//  ViewModel.swift
//  CodingExercise
//
//  Created by AnanyaK on 4/19/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var retrievedMealData : [Meal] = []
    let network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func getDessertData() async -> Result<Dessert,Failure> {
        await network.getDessertData()
    }
    
    func getMealDetails(mealId: String) async -> Result<Details, Failure> {
        await network.getMealDetails(mealId: mealId)
    }
}
