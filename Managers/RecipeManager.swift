//
//  RecipeManager.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 3/19/25.
//

import SwiftUI

struct RecipeManager: View {
    /*  @StateObject private var userProgress = UserProgress()
     @State private var userLevel: Int = 1
     let length: Int
     
     init(length: Int) {
     self.length = length
     }
     */
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                
                // display full list of Recipes
                
                NavigationLink(destination: SalmonRecipe()) {
                    RecipeCard(title: "Salmon")
                }
            }
        }
    }
    
    struct RecipeCard: View {
        let title: String
        var body: some View {
            VStack {
                Text(title)
                    .font(.system(.largeTitle, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.leading, 20)
                Spacer()
            }
            .frame(width: 350, height: 90)
            .background(Color(red: 0.6, green: 0.7, blue: 1.1))
            .cornerRadius(20)
        }
    }
}
