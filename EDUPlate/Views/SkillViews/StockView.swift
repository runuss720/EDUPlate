import SwiftUI

struct StockView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Stock Making")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center) 
                
                Image("stocks")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                
                Text("What is a Stock?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("A stock is a flavorful liquid used in soups, sauces, and stews. It is made by gently simmering various ingredients in water, such as meats, fish, and vegetables. Store-bought stocks are convenient, but if you want to truly elevate your dish, making your own stock is the way to go!")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 16)
                
                Divider()
                
                Text("The Basics")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Stock vs. Broth: Stocks come from simmering bones, while broths are made by boiling meat.")
                    Text("• Stocks are rich in nutrients, like collagen, which gives them a gelatinous texture when cooled.")
                    Text("• Slow simmering (not boiling) extracts maximum flavor and nutrition.")
                    Text("• This guide focuses on beef stock, but the same techniques apply to other meats.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                Text("Basic Beef Stock Recipe")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Image("beefbones")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.bottom, 16)
                
                Text("Start with beef bones. I recommend using beef shank and neck, which you can usually find at a butcher shop. Wash them in cold water to remove excess dirt and grime. Then, place them in a roasting pan along with mirepoix (a mixture of chopped celery, carrots, and onions).")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Preheat oven to 400°F.")
                    Text("• Roast until golden brown (usually 30–60 minutes).")
                    Text("• You're looking for a deep golden brown color like this:")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Image("roastedbeefbones")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.bottom, 16)
                
                Text("Once the vegetables and bones are roasted, transfer them to a large pot and cover with clean water until fully submerged. Add seasonings like thyme if desired. Bring to a gentle simmer and let cook for at least 6 hours (up to 8 for best results). Never let it boil.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 16)
                
                Divider()

                Text("Final Steps")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Strain the stock into a large container.")
                    Text("• Let it cool overnight in the fridge.")
                    Text("• A layer of fat will form on top—scrape it off before using.")
                    Text("• The stock should have a gelatinous texture—this means it's rich in collagen!")
                    Text("• Freeze for later use or enjoy immediately.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Stock Tip")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("For extra depth of flavor, roast your bones and vegetables longer until they develop a deep, rich color.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 20)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    StockView()
}
