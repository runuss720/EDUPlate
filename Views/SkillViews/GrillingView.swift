//
//  GrillingView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 2/17/25.
//


import SwiftUI

struct GrillingView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("becca-tapert-hneG0Illco4-unsplash")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                    .padding()
                    .overlay {
                        Text("Grilling Basics")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "A Brief Overview")
                    
                    Text("Grilling is a cooking method that uses direct heat to sear and cook food, typically over an open flame or hot grates. Start by preheating your grill—gas grills take about 10–15 minutes, while charcoal grills need 20–30 minutes for the coals to become white-hot. Clean and oil the grates before cooking to prevent sticking and enhance flavor.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "The Basics")
                    
                    Text("Choose the right heat level for your food: high heat (450–550°F) for steaks and burgers, medium heat (350–450°F) for chicken and fish, and low heat (250–350°F) for slow-cooking ribs or vegetables. Use tongs or a spatula instead of piercing meat to retain juices, and flip food only once for even cooking. A meat thermometer ensures safety—chicken should reach 165°F, and beef is safe at 145°F for medium.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    Image("29COOKINGKNIFESKILLS25-videoLarge")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                        .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                        .padding(.bottom, 16)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "Try it For Yourself")
                    
                    Text("Let grilled meats rest for a few minutes before slicing to allow juices to redistribute. Experiment with marinades, dry rubs, and wood chips for added flavor. With practice and attention to temperature control, you'll master the art of grilling in no time!")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                }
                
                Spacer().frame(height: 20)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    GrillingView()
}
