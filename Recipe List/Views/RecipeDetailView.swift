//
//  RecipeDetailView.swift
//  Recipe List
//
//  Created by Paul Fernbach on 3/6/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2

    var body: some View {
                
        // MARK: Title
        
        let dot = "•"
        
        // MARK: Recipe Image
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable().scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                // MARK: Serving size picker
                VStack(alignment: .leading) {
                    Text("Select your serving size")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle()).frame(width:200)
                        .font(Font.custom("Avenir", size: 15))
                }.padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top, .bottom], 5)
                    ForEach(recipe.ingredients) { item in
                        Text(dot + " " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    ForEach(0...recipe.directions.count-1, id:\.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom,2)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
                
                
            }
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // create a dummy
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
