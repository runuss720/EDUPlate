import SwiftUI

struct SalmonRecipe: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Marinated Salmon")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Image("salmondishfinished")
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
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("**Marinade:**")
                        .font(.headline)
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
                    
                    Text("**Salmon:**")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Group {
                        Text("• 1 lb salmon, sliced into meal-sized portions")
                        Text("• 2 tablespoons cooking oil")
                        Text("• Green onion, minced (for garnish)")
                        Text("• 1 teaspoon sesame seeds (for garnish)")
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
                    Text("1. **Prepare the marinade**: In a bowl, mix all marinade ingredients well.")
                    Text("2. **Marinate the salmon**: Add the salmon to the bowl and refrigerate for at least **1 hour** (the longer, the better).")
                    
                    Image("salmonmarinade")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250) // Adjust height as needed
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                        .padding(.horizontal, 90)
                    
                    Text("3. **Preheat the pan**: Heat **2 tbsp cooking oil** in a pan until it reaches **350°F** (oil should bubble when water touches it).")
                    Text("4. **Cook the salmon**: Place the salmon in the pan and cook on **high heat** until golden brown, about **2 minutes per side**.")
                    Text("   - Ensure the internal temperature reaches **145°F**.")
                    Text("   - If the fish is browning too fast, lower the heat.")
                    
                    Image("salmongrilled")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250) // Adjust height as needed
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                        .padding(.horizontal, 90)
                    
                    
                    Text("5. **Prepare the sauce**: Remove the cooked salmon and set it aside. Pour the marinade into the same pan and stir over **low heat**.")
                    Text("   - Cook for **5-10 minutes** until the brown sugar caramelizes and thickens into a syrupy sauce.")
                    Text("6. **Coat the salmon**: Return the salmon to the pan and coat all sides with the sauce.")
                    Text("7. **Garnish & Serve**: Sprinkle with **green onion** and **sesame seeds**. Serve immediately with **white rice and mango salsa**.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("🔹 **Cooking Tip**")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("A temperature gun is **super useful** for monitoring your pan’s surface temperature and ensuring even cooking.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

// Preview
#Preview {
    SalmonRecipe()
}
