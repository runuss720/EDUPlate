import SwiftUI

struct KnifeSkillView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Basic Knife Skills")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center) 
                
                Image("29COOKINGKNIFESKILLS25-videoLarge")
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
                
                Text("Knives may seem intimidating at first, but they are actually quite simple to use. It's important to master the basic principles to ensure safety while cooking. Here are some basic knife skills to get you started:")
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
                    Text("• Grip: Most chefs grip the knife by choking up on the handle while the thumb and index finger grip the top of the blade.")
                    Text("• Avoid the common mistake of wrapping the entire hand around the handle.")
                    Text("• Use the weight of the knife, sharpness of the blade, and strength of your arms to make cutting easier.")
                    Text("• The chef’s grip is the most efficient way to handle a knife for precise cutting.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                Text("Keep in Mind")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Nobody starts out perfect. If the knife seems awkward at first, that’s okay! Just keep practicing, and soon you'll be comfortable and confident in your knife skills.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 16)
                
                Divider()
                
                Text("Try it For Yourself")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Text("Practice your technique! Grab a piece of fruit or something similarly soft and try to slice it into uniform pieces. Don’t worry if it’s not perfect at first—just go slow, focus on control, and remember what you’ve learned.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                    .padding(.bottom, 20)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Knife Tip")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("A sharp knife is safer than a dull one! A dull blade requires more force and increases the risk of slipping.")
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
    KnifeSkillView()
}
