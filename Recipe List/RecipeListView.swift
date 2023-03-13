//
//  ContentView.swift
//  Recipe List
//
//  Created by Paul Fernbach on 3/4/23.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        VStack {
            NavigationView {
                
                List(model.recipes) { r in
                    NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                        HStack(spacing: 20) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height:50, alignment:.center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                    })
                }.navigationBarTitle("All Recipes")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
