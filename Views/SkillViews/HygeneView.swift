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
                        Text("Personal Hygene")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "A Brief Overview")
                    
                    Text("Maintaining good personal hygiene in the kitchen is vital for preventing food contamination and ensuring a safe cooking environment. Always wash your hands thoroughly with warm water and soap for at least 20 seconds before handling food, after touching raw meat, using the restroom, or handling garbage. Keep fingernails clean and trimmed to prevent bacteria buildup, and avoid wearing rings or bracelets that can trap germs. Wear clean clothing and, if necessary, an apron to protect food from dirt and bacteria. Tie back long hair or wear a hairnet to prevent stray hairs from falling into food. Avoid touching your face, hair, or phone while cooking, as these can introduce bacteria to your hands and food. If you have an open cut or wound on your hands, cover it with a waterproof bandage and wear gloves when handling food.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "Prevention")
                    
                    Text("Coughing or sneezing near food can spread germs, so always turn away and use a tissue or your elbow if needed. Never cook when sick, as illnesses can easily spread through food. Keeping these personal hygiene habits in mind helps create a cleaner kitchen and ensures the meals you prepare are safe and enjoyable for everyone.")
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
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HygeneView()
}
