import SwiftUI

struct MangoSalsaRecipe: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                
                Text("Mango Salsa")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                
                Image("mangoSalsa")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250) // Adjust height as needed
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 90)
                
                // Ingredients Section
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Group {
                    Text("• 1/4 cup soy sauce")
                    Text("• 1/4 cup oyster sauce")
                    Text("• 4 cloves garlic, minced")
                    Text("• 1 teaspoon ginger, minced")
                    Text("• 1 teaspoon sesame oil")
                    Text("• 1/4 cup Sake (or mirin)")
                    Text("• 1/4 cup brown sugar")
                }
                .font(.body)
                .foregroundColor(.gray)
                
                Divider()
                
                Text("Instructions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("1. **Combine all ingredients in a bowl and refrigerate.")
                    Text("2. **Served best with marinated Salmon and white rice.")
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
    MangoSalsaRecipe()
}
