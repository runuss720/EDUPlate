//
//  RecipeTabView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 3/19/25.
//
import SwiftUI

struct RecipeTabView: View {
    @StateObject private var userProgress = UserProgress()
    @State private var userLevel: Int = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Your Recipes")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .padding(.top, 10)
                            .foregroundStyle(.black)
                    }
                    // Display available lessons
                    RecipeManager()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    RecipeTabView()
}
