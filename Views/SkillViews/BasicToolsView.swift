import SwiftUI

struct BasicToolsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Title
                Text("Basic Materials")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center) // Center title
                
                // Image
                Image("debby-hudson-_HwEGoJKsaM-unsplash")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250) // Adjust height as needed
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 5)
                    .padding(.horizontal, 20)
                
                // Section: Overview
                Text("A Brief Overview")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Any time you're trying to learn a new skill, the most important thing is to study the fundamentals. All of those fancy cooking techniques you learn about in the future won't help you if you don't know basic knife skills, or how to chop an onion. These are some of the most important materials that will help you when you're just starting out")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 16)
                
                Divider()
                
                // Section: The Basics
                Text("Tools")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Quality cooking materials are essential to ensure the safety and taste of your food. These don't have to be fancy or expensive either. A simple set of pans, quality knives, and a plastic cutting board will ensure cleanliness while cooking, as well as reliability. You don't want the coating on your pans to start peeling off after one use, and trying to cut something with a dull knife can be dangerous. For those who are just starting out in the kitchen, here's a very basic list of what you'll need:")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 16)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• A set of 1-2 quality knives")
                    Text("• A nonstick pan")
                    Text("• A wooden and plastic spoon/spatula")
                    Text("• Plastic cutting boards (these are easier to clean and cheaper than wood)")
                    Text("• 1-2 Sheet pans for roasting/baking")
                    Text("• Measuring cups")
                    Text("• A food thermometer")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Text("🔹 ** Pan Tips **")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("While non-stick pans are convenient and easy to use, they come with drawbacks. Namely, the coating on the outside can release toxic chemicals if over-heated. It's important to monitor how hot your pan is getting, as anything over 500 degrees f can damage it, and to replace them every year or so. Cast-iron and stainless steel pans don't have this problem, but generally go for higher prices, and can require more skill when cooking.")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Divider()
                
                // Section: Proper Food Storage
                Text("Basic Ingredients")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Ingerdients vary greatly depending on what region of the world you live in, your price range, personal taste, etc. However, there are certain basic ingredients that appear more commonly in recipes. If you're just starting out and need ideas on what to buy, here's a simply list:")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Onions and garlic appear in many different recipes and are extremely handy to keep around.")
                    Text("• The starch/grain of your choice, such as potatoes, pasta, or rice")
                    Text("• Olive and vegetable oil")
                    Text("• Fresh vegetables (I prefer broccoli, spinach, or kale)")
                    Text("• Protein, such as chicken, beef, tofu, beans, etc.")
                    Text("• Fresh fruit")
                    Text("• Cheese, such as parmesan, mozzarella, or cheddar")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                // Section: Proper Food Storage
                Text("Seasonings")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Seasonings are one of the easiest ways to add flavor to a bland dish. They're relatively cheap, keep for a long time, and are easy to store. Here are some that you should keep on hand")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Salt/Pepper")
                    Text("• Garlic Powder")
                    Text("• Onion Powder")
                    Text("• Paprika")
                    Text("• Oregano")
                    Text("• Cumin")
                    Text("• Basil")
                    Text("• Thyme")
                    Text("• Rosemary")
                    Text("• Cinnamon")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Text("🔹 ** Seasoning Tips **")
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text("It can be tricky to remember what seasoning goes with what, and there are so many different kinds that it can be overwhelming when first starting out. That's why seasoning blends were created. These contain multiple different kinds of seasoning all mixed together to give your food flavor without risking adding the wrong seasonings. Try experimenting with these if you're worried about it.")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
        }
    }
}
#Preview {
    BasicToolsView()
}
