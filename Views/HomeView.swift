//
//  MyTrips.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            TabView {
                ScrollView {
                    VStack {
                        HStack {
                            Text("Level: 1")
                                .font(.system(.largeTitle, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .padding(.bottom, 8)
                                .foregroundStyle(.pink)
                            Text("Hello, Ruby!")
                                .font(.system(.body, weight: .medium))
                                .foregroundStyle(.secondary)
                        }
                        .padding(.bottom)
                        VStack(spacing: 16) {
                            Text("Test your knowledge".uppercased())
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipped()
                                .font(.system(.subheadline, weight: .medium).width(.expanded))
                                .foregroundStyle(.black)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack() {
                                    
                                    // Tools test
                                    NavigationLink(destination: Test1View()) {
                                        Image("utensils-unsplash")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(maxWidth: 350, maxHeight: 300)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                            .padding()
                                            .overlay {
                                                Text("Tools")
                                                    .kerning(2.0)
                                                    .font(.custom("Anton SC", size: 29))
                                                    .foregroundStyle(.white)
                                                    .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                                            }
                                    }
                                    
                                    // Ingredients test
                                    NavigationLink(destination: Test2View()) {
                                        Image("ingredients-unsplash")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(maxWidth: 350, maxHeight: 300)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                            .padding()
                                            .overlay {
                                                Text("Ingredients")
                                                    .kerning(2.0)
                                                    .font(.custom("Anton SC", size: 29))
                                                    .foregroundStyle(.white)
                                                    .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                                            }
                                    }
                                    
                                    // French terms test
                                    NavigationLink(destination: Test3View()) {
                                        Image("jez-timms-DVRXFIH42d0-unsplash (1)")
                                            .renderingMode(.original)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(maxWidth: 350, maxHeight: 300)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                            .padding()
                                            .overlay {
                                                Text("French Terms")
                                                    .kerning(2.0) // Adjusts the spacing between characters
                                                    .font(.custom("Anton SC", size: 29))
                                                    .foregroundStyle(.white)
                                                    .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    Divider()
                    Spacer().frame(height: 30)
                    
                    VStack(spacing: 16) {
                        Text("Lessons".uppercased())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .font(.system(.subheadline, weight: .medium).width(.expanded))
                            .foregroundStyle(.black)
                        
                        // New Section for Cooking Articles
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                
                                // Button 1: Knife Skills
                                NavigationLink(destination: KnifeSkillView()) {
                                    VStack(spacing: 0) {
                                        Image("blend-archive-HGJMNY7tBDw-unsplash")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                            .padding()
                                        
                                        Text("Knife Skills")
                                            .font(.headline)
                                            .padding(.top, 5)
                                    }
                                }
                                
                                // Button 2: Roasting
                                NavigationLink(destination: RoastingView()) {
                                    VStack(spacing: 0) {
                                        Image("angela-khebou-rgB9ZCw3XiU-unsplash")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                            .padding()
                                        Text("Roasting")
                                            .font(.headline)
                                            .padding(.top, 5)
                                    }
                                }
                                
                                // Button 3: Soups
                                NavigationLink(destination: SoupsView()) {
                                    VStack(spacing: 0) {
                                        Image("Buffalo-Sauce-Recipe-SQ")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                            .padding()
                                        Text("Soups")
                                            .font(.headline)
                                            .padding(.top, 5)
                                    }
                                }
                                
                                // Button 4: Soups
                                NavigationLink(destination: StockView()) {
                                    VStack(spacing: 0) {
                                        Image("stocks")
                                            .renderingMode(.original)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 150, height: 150)
                                            .clipped()
                                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                            .padding()
                                        Text("Stocks")
                                            .font(.headline)
                                            .padding(.top, 5)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .accentColor(.black)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeView()
}
