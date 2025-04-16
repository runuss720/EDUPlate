import SwiftUI

struct ScallopsRecipe: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                
                Text("Seared Scallops")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                
                Image("scallopsfinished")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 90)
                
                // Ingredients Section
                Text("Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Group {
                    Text("• 1 pound raw scallops")
                    Text("• 1 tablespoon olive oil")
                    Text("• 2 tablespoon salt, + more to taste")
                    Text("• 2 tablespoon ground black pepper, + more to taste")
                    Text("• 4 cloves garlic, minced")
                    Text("• 3 tablespoons butter")
                    Text("• Juice of 1/2 lemon")
                    Text("• 1/4 cup heavy cream")
                    Text("• 1/2 cup white wine (optional)")
                    Text("• 2 tablespoons parsley, finely chopped")
                }
                .font(.body)
                .foregroundColor(.gray)
                
                Divider()
                
                Text("Instructions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("1. **Pat both sides of scallops dry with a paper towl, and season with salt and pepper")
                    Text("2. **on medium-high heat, add olive oil and sear both sides for around 2 minutes each, or until golden brown")
                    
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 20)
                
                Divider()
                
                Image("scallops")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250) 
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 90)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("2. **Once done cooking, set scallops aside. They should look similar in color to the picture. Deglaze the pan with white wine")
                    Text("2. **add butter and garlic and cook on medium heat until fragarant")
                    Text("2. **add lemon, parsley, and heavy cream and cook for an additional minute or until combined")
                    Text("2. **add scallops back into the pan and make sure each one is coated in the sauce. At this point, you should taste and adjust the salt and pepper as needed. Remember, it's better to undersalt your dish and be able to add more later, than to add too much at the beggining")
                    Text("2. **Best served with pasta or orzo, but feel free to eat it on it's own")
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
    ScallopsRecipe()
}
