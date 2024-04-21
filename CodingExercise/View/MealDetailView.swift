//
//  MealDetailView.swift
//  CodingExercise
//
//  Created by AnanyaK on 4/19/24.
//

import SwiftUI

struct MealDetailView: View {
    @ObservedObject var viewModel: ViewModel
    @State var mealDetails: MealDetails?
    let meal: Meal
    
    var body: some View {
        VStack {
            if let mealDetails = mealDetails {
                ScrollView {
                    VStack (alignment: .leading, spacing: 5) {
                        Text("Meal")
                            .bold()
                            .font(.title)
                        Text(mealDetails.meal)
                        Text("Instructions")
                            .bold()
                            .font(.title)
                        Text(mealDetails.instructions)
                    }
                }
                .scrollBounceBehavior(.basedOnSize)
            } else {
                ProgressView()
            }
        }
       .padding()
       .navigationTitle("Recipe Details")
       .onAppear(perform: retrieveMealDetails)
    }
    
    func retrieveMealDetails() {
        Task {
            let result = await viewModel.getMealDetails(mealId: meal.id)
            switch result {
            case .success(let mealData):
                mealDetails = mealData.meals.first
            case .failure( let failure):
                print(failure)
            }
        }
    }
}
