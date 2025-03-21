//
//  FoodSafetyView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 3/20/25.
//

import SwiftUI

struct FoodSafetyView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Title
                Text("Food Safety")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center) // Center title
                
                // Image
                Image("becca-tapert-hneG0Illco4-unsplash")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250) // Adjust height as needed
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                
                // Section: Overview
                Text("A Brief Overview")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Food safety is crucial for preventing foodborne illnesses and ensuring meals are safe to eat. Always start by **washing your hands** with soap and warm water for **at least 20 seconds** before handling food. Keep **raw meats, poultry, and seafood separate** from other foods to prevent cross-contamination. Use separate cutting boards and utensils for raw and cooked items. Wash fruits and vegetables under running water before eating, even if you plan to peel them.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 16)
                
                Divider()
                
                // Section: The Basics
                Text("The Basics")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• **Cook food to the right temperature** to kill harmful bacteria.")
                    Text("• Use a **food thermometer** to check internal temperatures:")
                    Text("   - Poultry: **165°F**")
                    Text("   - Ground meats: **160°F**")
                    Text("   - Whole cuts of beef, pork, fish: **145°F**")
                    Text("• Avoid the **danger zone (40–140°F)**, where bacteria multiply quickly.")
                    Text("• **Refrigerate leftovers** within **two hours** (or **one hour** in hot weather).")
                    Text("• Store perishable items at **or below 40°F** and reheat leftovers to at least **165°F**.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                // Additional Image
                Image("29COOKINGKNIFESKILLS25-videoLarge") 
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.bottom, 16)
                
                Divider()
                
                // Section: Proper Food Storage
                Text("Proper Food Storage")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Proper food storage helps maintain freshness and safety. Store **raw meats on the lowest shelf** in the refrigerator to prevent drips onto other foods. Label leftovers with dates and consume them within a safe timeframe—typically **three to four days**. When in doubt, throw it out; **spoiled food may not always show signs of contamination**. By following these food safety basics, you can minimize risks and enjoy safe, delicious meals every time!")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 20)
                
                Divider()
                
                // Food Safety Tip
                VStack(alignment: .leading, spacing: 8) {
                    Text("🔹 **Food Safety Tip**")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("Keeping a **digital thermometer** in your kitchen ensures your food is always cooked to safe temperatures.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 20)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

// Preview
#Preview {
    FoodSafetyView()
}
