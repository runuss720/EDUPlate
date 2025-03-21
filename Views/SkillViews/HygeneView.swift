//
//  HygeneView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 2/17/25.
//

import SwiftUI

struct HygeneView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Title
                Text("Personal Hygiene")
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
                
                Text("Maintaining **good personal hygiene** in the kitchen is vital for **preventing food contamination** and ensuring a safe cooking environment. Always **wash your hands thoroughly** with warm water and soap for **at least 20 seconds** before handling food, after touching raw meat, using the restroom, or handling garbage.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• **Keep fingernails clean and trimmed** to prevent bacteria buildup.")
                    Text("• **Avoid wearing rings or bracelets** that can trap germs.")
                    Text("• **Wear clean clothing** and use an **apron** to protect food.")
                    Text("• **Tie back long hair** or wear a hairnet to prevent stray hairs in food.")
                    Text("• **Avoid touching your face, hair, or phone** while cooking.")
                    Text("• If you have a **cut or wound**, cover it with a **waterproof bandage** and wear gloves.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                // Section: Prevention
                Text("Prevention")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• **Avoid coughing or sneezing near food.** If needed, turn away and use a tissue or your elbow.")
                    Text("• **Never cook when sick,** as illnesses can spread through food.")
                    Text("• **Practice these habits** to maintain a cleaner kitchen and ensure safe meals for everyone.")
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
                
                // Hygiene Tip
                VStack(alignment: .leading, spacing: 8) {
                    Text("🧼 **Hygiene Tip**")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("Keep **hand sanitizer** near your kitchen in case soap and water aren’t available, but always wash with soap when possible.")
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
    HygeneView()
}
