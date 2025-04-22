import SwiftUI

struct MangoSalsaRecipe: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Mango Salsa")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                
                Image("mangoSalsa")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 90)
                
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Group {
                    Text("• 1 mango, diced")
                    Text("• 1 avocado, diced")
                    Text("• 1/4 cup cilantro, diced")
                    Text("• 2 tbsp diced red onion")
                    Text("• 1 teaspoon sesame oil")
                    Text("• juice of half a lime")
                    Text("• salt and pepper to taste")
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
