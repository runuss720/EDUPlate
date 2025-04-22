import SwiftUI

struct SoupsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Soup Making")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Image("ella-olsson-fxJTl_gDh28-unsplash")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                
                Text("Background")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("For people just getting into cooking, soup-making is a great place to start. Most soups don’t require fancy techniques or equipment, making them beginner-friendly. Plus, soups are a healthy choice, adding fiber and vegetables to your diet.")
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
                    Text("Most soups consist of the following elements:")
                    Text("• Fat: Oil, butter, or other base for sautéing.")
                    Text("• Liquid: Chicken broth, vegetable broth, or cream.")
                    Text("• Meat (optional): Chicken, beef, seafood, or plant-based protein.")
                    Text("• Vegetables: Onions, carrots, tomatoes, celery, etc.")
                    Text("• Seasonings: Herbs, salt, pepper, and spices.")
                    Text("• Flavor combinations vary greatly based on personal taste and the chosen recipe.")
                    Text("• Beginners should follow a guide or recipe—for example, my famous tomato soup recipe!")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Soup Tip")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("For a richer flavor, try roasting your vegetables before blending them into your soup!")
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
    SoupsView()
}
