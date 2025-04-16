import SwiftUI

struct BrusselSaladRecipe: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Brussel Salad")
                    .font(.system(size: 29, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                
                Image("brussels")
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
                    
                    Group {
                        Text("• 1 cup chopped brussels sprouts")
                        Text("• 1 tablespoon olive oil")
                        Text("• 1 shallot, minced")
                        Text("• 1-2 strips of bacon (optional)")
                        Text("• 1 tablespoon balsamic vinegar")
                        Text("• Juice of 1/2 lemon")
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
                    Text("1. Preheat oven to 400 degrees F")
                    Text("2. Place bacon strips on a pan lined with parchment paper and bake for 15-20 minutes")
                    Text("3. In the meantime, on medium heat sauté shallot in a pan with oil until soft")
                    Text("4. Add brussel sprouts, seasonings, and vinegar and stir on medium low heat for about 10 mintes")
                    Text("5. Once your bacon is done, chop into bite size pieces and add to the brussel sprouts, along with lemon juice.")
                    Text("6. Serve immediately, best eaten on its own or as a side dish")
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
    BrusselSaladRecipe()
}
