//
//  CodingExerciseApp.swift
//  CodingExercise
//
//  Created by AnanyaK on 4/19/24.
//

import SwiftUI

@main
struct CodingExerciseApp: App {
    @StateObject var viewModel = ViewModel(network: NetworkService())
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
