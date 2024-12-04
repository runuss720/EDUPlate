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
                                Text("Upcoming Tests".uppercased())
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .clipped()
                                    .font(.system(.subheadline, weight: .medium).width(.expanded))
                                    .foregroundStyle(.black)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack() {
                                        NavigationLink(destination: Test1View()) {
                                            Image("christina-rumpf-gUU4MF87Ipw-unsplash")
                                                .renderingMode(.original)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(maxWidth: 350, maxHeight: 300)
                                                .clipped()
                                                .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                                .padding()
                                                .overlay {
                                                    Text("Test 1 - Basics")
                                                        .kerning(2.0)
                                                        .font(.custom("Anton SC", size: 29))
                                                        .foregroundStyle(.white)
                                                        .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                                                }
                                        }
                                        NavigationLink(destination: Test2View()) {
                                            Image("walter-otto-PT70CT6mATQ-unsplash")
                                                .renderingMode(.original)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(maxWidth: 350, maxHeight: 300)
                                                .clipped()
                                                .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                                                .padding()
                                                .overlay {
                                                    Text("Test 2 - Food Safety")
                                                        .kerning(2.0)
                                                        .font(.custom("Anton SC", size: 29))
                                                        .foregroundStyle(.white)
                                                        .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                                                }
                                        }
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
                                                    Text("Test 3 - Meat and Fish")
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
                            }
                        }
                    }
                        .padding(.horizontal)
                }
            }
                // text color
                .accentColor(.black)
        }
        // Hide the back button
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    HomeView()
}