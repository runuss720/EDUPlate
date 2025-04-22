import SwiftUI

struct SpinachOrzoRecipe: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Spinach Orzo")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Image("spinach_orzo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .shadow(radius: 5)
                    .padding(.horizontal, 90)
                
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Group {
                        Text("• 1 tablespoon olive oil")
                        Text("• 1 tablespoon butter")
                        Text("• 4 cloves garlic, minced")
                        Text("• 1 shallot, minced")
                        Text("• 1/2 cup white wine (optional)")
                        Text("• 1/2 cup uncooked orzo pasta")
                        Text("• 1 1/4 cup chicken broth")
                        Text("• The juice of half a lemon")
                        Text("• 1 cup chopped fresh spinach")
                        Text("• 1 teaspoon garlic powder")
                        Text("• 1/2 cup grated parmesan cheese")
                        Text("• Salt and pepper to taste")
                    }
                    .font(.body)
                    .foregroundColor(.gray)
                }
                
                Divider()
                
                Text("Instructions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("1. Sauté shallot in oil and butter for a few minutes on medium heat until soft and translucent.")
                    Text("2. Add garlic and stir until fragrant, careful not to burn it!")
                    Text("3. Add in your white wine and cook until evaporated, about 1 minute ")
                    Text("4. Add orzo, chicken broth, lemon, and seasoning to your pan and bring everything to a simmer. Then turn the heat to low.")
                    Text("Cook for about 10-15 minutes, then add in spinach and parmesan cheese. Cook for an additional 5-10 minutes, checking frequently to make sure the pasta hasn't overcooked. It should have a soft, slightly chewy consistency.")
                    Text("Finally, add salt and pepper as needed. Best served with a protein such as salmon or chicken.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("🔹 **Cooking Tip**")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("Remember to taste your food as you cook. Just because the recipe you're using calls for a certain amount of something, doesn't mean you need to follow it exactly. If you want to add more salt, or extra lemon, or less oil, go for it!")
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
    SpinachOrzoRecipe()
}
