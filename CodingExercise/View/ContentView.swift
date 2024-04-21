//
//  ContentView.swift
//  CodingExercise
//
//  Created by AnanyaK on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.retrievedMealData) { detailedMealInfo in
                NavigationLink(destination: MealDetailView(viewModel: viewModel, meal: detailedMealInfo)) {
                    HStack {
                        Text(detailedMealInfo.meal)
                            .bold()
                    }
                    .padding(.horizontal, -12)
                }
            }
            .navigationTitle("Dessert Recipes")
        }
        .onAppear(perform: retrieveDessertData)
    }
    
    func retrieveDessertData() {
        Task {
            let result = await viewModel.getDessertData()
            switch result {
            case .success(let mealDetails):
                self.viewModel.retrievedMealData = mealDetails.meals
                
            case .failure( let failure):
                print(failure)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var viewModel = ViewModel(network: NetworkService())
        ContentView(viewModel: viewModel)
    }
}
