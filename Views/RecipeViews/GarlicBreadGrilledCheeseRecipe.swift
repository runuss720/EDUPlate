import SwiftUI

struct GarlicBreadGrilledCheeseRecipe: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Garlic Bread Grilled Cheese")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Image("garlic_bread")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250) // Adjust height as needed
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 90)
                
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Group {
                        Text("• 2 Slices of sourdough bread (or whatever bread you prefer)")
                        Text("• 1 tablespoon butter")
                        Text("• 3 cloves garlic, minced")
                        Text("• 1 teaspoon italian seasoning")
                        Text("• 1/2 cup grated cheddar, mozzarella, or a combination of both")
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
                    Text("1.Using either a microwave or pan, melt butter and add garlic and seasonings. Let it sizzle for about 30 seconds until fragrant. (About 1 minute in the microwave)")
                    Text("2. Brush the outer sides of your bread with the butter mixture. Place the cheese on the un-buttered sides of the bread and form into a sandwich.")
                    Text("3. Place buttered side down on a pan on medium heat and cook for about 2-3 minutes, or until golden brown, then flip and repeat on the other side.")
                    Text("4. If the cheese still hasn't melted at this point, lower the heat and cover for an additional 2-3 mintues, making sure to not burn the bread")
                    Text("Take off the heat and serve immedietly. Best served with homemade tomato soup.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
                
                Divider()
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    GarlicBreadGrilledCheeseRecipe()
}
