//
//  DataService.swift
//  Recipe List
//
//  Created by Paul Fernbach on 3/4/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        // parse local json data
        
        // get a URL to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create URL object
        let url = URL(fileURLWithPath: pathString!)

        do {
            // create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            let recipeData = try decoder.decode([Recipe].self, from: data)
        
            // Add the unique ids
            for r in recipeData {
                r.id = UUID()
            }
            
            // return the recipes
            return recipeData
            
        } catch {
            print(error)
        }

        // return empty recipes
        return [Recipe]()
    }
}
