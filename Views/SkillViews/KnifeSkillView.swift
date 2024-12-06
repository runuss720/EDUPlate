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
                        Text("Basic Knife Skills")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "Background")
                    
                    Text("Knives may seem intimidating at first, but they are actually quite simple to use. It's important to master the basic principles to make sure you don't hurt yourself while cooking. Here are some basic knife skills to get you started")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "The Basics")
                    
                    Text("For the knife grip used by most chefs, the palm of the hand chokes up on the handle, while the thumb and index finger grip the top of the blade. This is different from how many home cooks hold a knife, by wrapping the entire hand around the handle. The chef’s grip has evolved that way for a reason: it’s the most efficient way to use the weight of the knife, the sharpness of its blade, and the strength of your arms, which makes for the easiest cutting.")
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
                    SectionHeader(title: "Keep in Mind")
                    
                    Text("Nobody starts out perfect. If the knife seems a bit awkward at first that's ok! Just keep practicing and soon you'll be a master of the knife.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    SectionHeader(title: "Try it For Yourself")
                    
                    Text("Try using the techniques you learned in real life. Get a piece of fruit (or something similarly soft) and try to slice it into uniform pieces. Don't worry if you don't get it right on your first try, remember practice makes perfect. Just go slow and try to remember everything you've learned")
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

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .kerning(1.0)
                .font(.custom("Anton SC", size: 29))
            Spacer()
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    KnifeSkillView()
}
