//
//  SoupsView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//
import SwiftUI

struct SoupsView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("ella-olsson-fxJTl_gDh28-unsplash")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                    .padding()
                    .overlay {
                        Text("Soup Making")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 16) {
                    SectionHeader(title: "Background")
                    
                    Text("For people just getting into cooking, soup-making is a great place to start. Not only do most soups not require any fancy techniques or equipment, they are also a healthy choice that can add fiber and vegetables to your diet.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "The Basics")
                    
                    Text("Most soups consist of the following elements: fat (such as oil or butter), liquid (like chicken broth or cream), meat (optional), vegetables, and seasonings. Flavor combinations can vary massively depending on a mixture of personal taste and what recipe you decide to use. It's generally a good idea for beginners to follow a guide, so I've included my famous tomato soup recipe.")
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
    SoupsView()
}
