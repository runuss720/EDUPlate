//
//  SubscriptionOptions.swift
//  Ruby Nuss
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//
import SwiftUI

struct RoastingView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("christina-rumpf-gUU4MF87Ipw-unsplash")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                    .padding()
                    .overlay {
                        Text("Vegetable Roasting")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 16) {
                    SectionHeader(title: "Background")
                    
                    Text("Roasting Vegetables is surprisingly easy and very good for you. The health benefits of adding a few vegetables to your meals are well-known and worth it.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "The Basics")
                    
                    Text("Vegetables can be very forgiving, so it doesn't really matter what kind you choose. Just go with your favorite. For me, I like to go with a mix of broccoli and zucchini. Just make sure to coat your veggies evenly in a mixture of salt, olive oil, pepper, and whatever seasoning you feel like. Then roast in the oven for about 20 minutes at 350 degrees Fahrenheit.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    SectionHeader(title: "Keep in Mind")
                    
                    Text("It's important to make sure your veggies don't overcook, or else they will become dry and tasteless. Also, make sure to use a good quality olive oil, and salt and pepper to taste. If you want to add an extra bit of flavor, try adding some parmesan cheese at the end!")
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
    RoastingView()
}

