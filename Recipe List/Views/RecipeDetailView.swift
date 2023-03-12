//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Paul Fernbach on 3/6/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        // MARK: Title
        
        let dot = "•"
        
        // MARK: Recipe Image
        ScrollView {
            VStack {
                Image(recipe.image)
                    .resizable().scaledToFit()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding([.top, .bottom], 5)
                    ForEach(recipe.ingredients) { item in
                        Text(dot + " " + item.name)
                    }
                }.padding(.bottom, 20)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding([.bottom, .top], 5)
                    ForEach(0...recipe.directions.count-1, id:\.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom,2)
                    }
                }
                .padding(.horizontal)
                
                
            }
        }.navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // create a dummy
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
