//
//  KnifeSkillView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//

import SwiftUI

struct KnifeSkillView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image("becca-tapert-hneG0Illco4-unsplash")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                    .padding()
                    .overlay {
                        Text("Basic Knife Skills")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 9) {
                    HStack(alignment: .firstTextBaseline, spacing: 9) {
                        // Title
                        Text("Background")
                            .kerning(1.0)
                            .font(.custom("Anton SC", size: 29))
                        Spacer()
                        VStack(alignment: .trailing) {
                            
                        }
                    }
                    
                    HStack(alignment: .firstTextBaseline) {
                        // Description
                        Text("Knives may seem intimidating at first, but they are actually quite simple to use. It's important to master the basic principles to make sure you don't hurt yourself while cooking. Here are some basic knife skills to get you started")
                            .font(.system(size: 12, weight: .regular, design: .monospaced))
                            .lineSpacing(2)
                    }
                    
                    VStack(alignment: .leading, spacing: 9) {
                        HStack(alignment: .firstTextBaseline, spacing: 9) {
                            Text("The Basics")
                                .kerning(1.0)
                                .font(.custom("Anton SC", size: 29))
                            Spacer()
                            VStack(alignment: .trailing) {
                            }
                        }
                    }
                    
                    HStack(alignment: .firstTextBaseline) {
                        Text("For the knife grip used by most chefs, the palm of the hand chokes up on the handle, while the thumb and index finger grip the top of the blade. This is different from how many home cooks hold a knife, by wrapping the entire hand around the handle. The chef’s grip has evolved that way for a reason: it’s the most efficient way to use the weight of the knife, the sharpness of its blade, and the strength of your arms, which makes for the easiest cutting.")
                            .font(.system(size: 12, weight: .regular, design: .monospaced))
                            .lineSpacing(2)
                        
                    }
                    
                    VStack(spacing: 16) {
                        Image("29COOKINGKNIFESKILLS25-videoLarge")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .clipped()
                            .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                            .padding()
                    }
                }
                
                VStack(alignment: .leading, spacing: 9) {
                    HStack(alignment: .firstTextBaseline, spacing: 9) {
                        Text("Keep in Mind")
                            .kerning(1.0)
                            .font(.custom("Anton SC", size: 29))
                        Spacer()
                        VStack(alignment: .trailing) {
                        }
                    }
                }
                
                HStack(alignment: .firstTextBaseline) {
                    Text("Nobody starts out perfect. If the knife seems a bit akward at first thats ok! Just keep practicing and soon you'll be a master of the knife.")
                        .font(.system(size: 12, weight: .regular, design: .monospaced))
                        .lineSpacing(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .clipped()
            }
            Spacer().frame(height: 20)
            HStack(alignment: .firstTextBaseline) {
                Text("source: https://cooking.nytimes.com/guides/23-basic-knife-skills")
                    .font(.system(size: 12, weight: .regular, design: .monospaced))
                    .lineSpacing(2)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipped()
        }
    }
}

#Preview {
    KnifeSkillView()
}
