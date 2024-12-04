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
            VStack(spacing: 16) {
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
                             // spacing between characters
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white) 
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0) // Adds a shadow with black color and radius of 18
                    }
                
                VStack(alignment: .leading, spacing: 9) {
                    HStack(alignment: .firstTextBaseline, spacing: 9) {
                        // Title
                        Text("Background")
                            .kerning(1.0)
                            .font(.custom("Anton SC", size: 29))
                        VStack(alignment: .trailing) {
                            
                        }
                    }
                    HStack(alignment: .firstTextBaseline) {
                        // Description
                        Text("For people just getting into cooking, soup-making is a great place to start. Not only do most soups not require any fancy techniques or equitment, they are also a healthy choice that can add fiber and vegetables to your diet")
                            .font(.system(size: 12, weight: .regular, design: .monospaced))
                            .lineSpacing(2)
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 9) {
                        HStack(alignment: .firstTextBaseline, spacing: 9) {
                            // Title
                            Text("The Basics")
                                .kerning(1.0)
                                .font(.custom("Anton SC", size: 29))
                            VStack(alignment: .trailing) {
                                
                            }
                        }
                    }
                    HStack(alignment: .firstTextBaseline) {
                        // Description
                        Text("Most soups consist of the following elements: fat (such as oil or butter), liquid (like chicken broth or cream), meat (optional), vegetables, and seasonings. Falvour cominations can vary massively depending on a mixture of personal taste and what recipe you decide to use. It's generally a good idea for beginners to follow a guide, so I've included my famous tomato soup recipe")
                            .font(.system(size: 12, weight: .regular, design: .monospaced))
                            .lineSpacing(2)
                    }
                }
            }
            
            // source for information here
            Spacer().frame(height: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("source:")
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
                    .lineSpacing(2)
                    .foregroundStyle(.secondary)
            }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
}

#Preview {
    SoupsView()
}
