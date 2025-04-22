import SwiftUI

struct GrillingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
    
                Text("Grilling Basics")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
    
                Image("grilling")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
    
                Text("A Brief Overview")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Grilling is a fun, easy way to cook food that's perfect for parties and events. But it can be tricky if not done correctly. It is a cooking method that uses direct heat to sear and cook food, typically over an open flame or hot grates. The flame can often produce a deeper, smoky flavor that can't be achieved using ovens or other means of cooking, making it a popular option for meats and seafood.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 16)
                
                Divider()
   
                Text("Gas vs Charcoal")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Depending on your wants or needs, either can be useful. Gas grills are generally easier to use, light quicker, and require less mess. Charcoal burns hotter and tends to produce a better sear on meat. There isn't one correct option here. Try both and see which one you like better!")
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
                    Text("• Choose the right heat level:")
                    Text("   - High heat (450–550°F): Steaks, burgers")
                    Text("   - Medium heat (350–450°F): Chicken, fish")
                    Text("   - Low heat (250–350°F): Ribs, vegetables (slow-cooking)")
                    Text("• Use tongs or a spatula to avoid piercing meat and losing juices.")
                    Text("• Flip food only once for even cooking.")
                    Text("• Check temperatures:")
                    Text("   - Chicken: 165°F")
                    Text("   - Beef (medium): 145°F")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
 
                Text("Try it For Yourself")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Start by preheating your grill according to the manufacturer's instructions. Most grills take around 10-15 minutes to heat up (if it's cold outside it may take longer). Clean and oil the grates before cooking to prevent sticking and enhance flavor. Once finished cooking, let grilled meats rest for a few minutes before slicing to allow juices to redistribute. Experiment with marinades, dry rubs, and wood chips for added flavor.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 20)
                
                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Grilling Tip")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("Keeping the grill hot can be a challenge, specially if it's cold outside. To ensure your food gets a good sear, make sure to leave it on for at least a few mintes without touching aything.")
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
    GrillingView()
}
