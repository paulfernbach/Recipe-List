//
//  RecipeHighlights.swift
//  Recipe List
//
//  Created by Paul Fernbach on 3/14/23.
//

import SwiftUI

struct RecipeHighlights: View {

    var allHighlights = ""
    
    init(highlights:[String]) {
        // loop through the highlights and build a concatenated string
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights:["test","test2","test3"])
    }
}
