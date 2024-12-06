//
//  StockView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 12/5/24.
//

import SwiftUI

struct StockView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("stocks")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                    .padding()
                    .overlay {
                        Text("Stock Making")
                            .kerning(2.0)
                            .font(.custom("Anton SC", size: 29))
                            .foregroundStyle(.white)
                            .shadow(color: Color.black, radius: 18, x: 0, y: 0)
                    }
                
                VStack(alignment: .leading, spacing: 16) {
                    SectionHeader(title: "What is a Stock?")
                    
                    Text("A stock is a flavorful liquid used in the preparation of soups, sauces, and stews. Ir is derived by gently simmering various ingredients in water, including meats, fish, vegetables, etc. Of course, store bought stocks are handy and usually do the trick, but if you really want to elevate your dish, keep reading!")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "The Basics")
                    
                    Text("Stocks are often confused with broth, which is a similar liquid derived from boiling meat, while stocks are made from simmering bones. Stocks are rich in both flavor and nutrients such as collagen. This lesson will focus on beef stock, but these techniques can be applied to other meats as well.")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    SectionHeader(title: "Basic Beef Stock Recipe")
                    
                    Image("beefbones")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                        .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                        .padding(.bottom, 16)
                    
                    Text("Start with beef bones. I usually use beef shank and neck, which your local butcher usually supplies. Wash them in cold water to get any excess dirt and grime off. Add them to a pan along with your mirepoix (a mixture of chopped celery, carrot, and onions) then roast them at 400 degrees farenheit until golden brown (this usually takes around 30-60 minutes depending on your oven) You're looking for a deep golden brown color, like this:")
                        .font(.system(size: 14, weight: .regular, design: .monospaced))
                        .lineSpacing(4)
                        .padding(.bottom, 16)
                    
                    Image("roastedbeefbones")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                        .mask { RoundedRectangle(cornerRadius: 34, style: .continuous) }
                        .padding(.bottom, 16)
                    
                    Text("Once the vegetables and meat are done roasting, add them to a large pot and fill with clean water until everything is submerged. Feel free at this point to add other seasonings, such as thyme. Bring to a gentle simmer and let it cook at least 6 hours, but up to 8 if you have time. Make sure your liquid never boils. By this point you should have a beautiful stock, congrats! Drain the liquid into a large container and let it sit overnight. Once it's cooled completely, a layer of fat will appear on top. Scrape it off and you should be left with a a substance that jiggles when you touch it. Feel free to freeze your stock for later use, or use immedietly. ")
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
    StockView()
}
