//
//  RecipeModel.swift
//  Recipe List
//
//  Created by Paul Fernbach on 3/4/23.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // create an instance of the service
        self.recipes = DataService.getLocalData()
    }
}
