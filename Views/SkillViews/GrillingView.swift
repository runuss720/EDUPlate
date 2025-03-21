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
            VStack(alignment: .leading, spacing: 16) {
                
                // Title
                Text("Grilling Basics")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center) // Center title
                
                // Image
                Image("grilling")
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
                
                Text("Grilling is a cooking method that uses direct heat to sear and cook food, typically over an open flame or hot grates. Start by **preheating your grill**—gas grills take about **10–15 minutes**, while charcoal grills need **20–30 minutes** for the coals to become white-hot. **Clean and oil the grates** before cooking to prevent sticking and enhance flavor.")
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
                    Text("• **Choose the right heat level:**")
                    Text("   - **High heat (450–550°F):** Steaks, burgers")
                    Text("   - **Medium heat (350–450°F):** Chicken, fish")
                    Text("   - **Low heat (250–350°F):** Ribs, vegetables (slow-cooking)")
                    Text("• **Use tongs or a spatula** to avoid piercing meat and losing juices.")
                    Text("• **Flip food only once** for even cooking.")
                    Text("• **Check temperatures:**")
                    Text("   - **Chicken:** 165°F")
                    Text("   - **Beef (medium):** 145°F")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                // Section: Try it For Yourself
                Text("Try it For Yourself")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Let grilled meats **rest for a few minutes** before slicing to allow juices to redistribute. Experiment with **marinades, dry rubs, and wood chips** for added flavor. With practice and **temperature control**, you'll master the art of grilling in no time!")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 20)
                
                Divider()
                
                // Grilling Tip
                VStack(alignment: .leading, spacing: 8) {
                    Text("🔥 **Grilling Tip**")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("Use a **grill thermometer** to ensure your heat levels are perfect for every dish.")
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
    GrillingView()
}
