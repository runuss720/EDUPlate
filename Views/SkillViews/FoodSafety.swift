//
//  FoodSafety.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 2/17/25.
//


import SwiftUI

struct FoodSafetyView: View {
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
                        Text("Food Safety")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "A Brief Overview")
                    
                    Text("Food safety is crucial for preventing foodborne illnesses and ensuring meals are safe to eat. Always start by washing your hands with soap and warm water for at least 20 seconds before handling food. Keep raw meats, poultry, and seafood separate from other foods to prevent cross-contamination—use separate cutting boards and utensils for raw and cooked items. Wash fruits and vegetables under running water before eating, even if you plan to peel them.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "The Basics")
                    
                    Text("Cooking food to the right temperature is key to killing harmful bacteria. Use a food thermometer to check internal temperatures—poultry should reach 165°F, ground meats 160°F, and whole cuts of beef, pork, and fish at least 145°F. Avoid the “danger zone” (40–140°F), where bacteria multiply quickly. Refrigerate leftovers within two hours (or one hour in hot weather) and store perishable items at or below 40°F. Reheat leftovers to at least 165°F before consuming.")
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
                    
                    Text("Proper food storage helps maintain freshness and safety. Store raw meats on the lowest shelf in the refrigerator to prevent drips onto other foods. Label leftovers with dates and consume them within a safe timeframe—typically three to four days. When in doubt, throw it out; spoiled food may not always show signs of contamination. By following these food safety basics, you can minimize risks and enjoy safe, delicious meals every time!")
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
    FoodSafetyView()
}
