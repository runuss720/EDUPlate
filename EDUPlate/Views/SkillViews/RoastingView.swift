import SwiftUI

struct RoastingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Vegetable Roasting")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center) 
                
                Image("christina-rumpf-gUU4MF87Ipw-unsplash")
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
                
                Text("Roasting vegetables is surprisingly easy and packed with health benefits. Adding a few roasted vegetables to your meals is a great way to boost nutrition while enhancing flavor.")
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
                    Text("• Choose any vegetables you like—broccoli, zucchini, carrots, or bell peppers all work well.")
                    Text("• Coat vegetables evenly with a mixture of:")
                    Text("   - Olive oil")
                    Text("   - Salt and pepper")
                    Text("   - Any additional seasoning you prefer")
                    Text("• Preheat the oven to 350°F.")
                    Text("• Roast for about 20 minutes or until vegetables are tender and slightly crispy.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                Text("Keep in Mind")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Don’t overcook your veggies—they should be tender, not dry.")
                    Text("• Use high-quality olive oil for the best flavor.")
                    Text("• Taste and adjust seasoning with salt and pepper.")
                    Text("• For extra flavor, sprinkle parmesan cheese on top before serving!")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Roasting Tip")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("For even cooking, spread vegetables out in a single layer on the baking sheet—avoid overcrowding!")
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
    RoastingView()
}
