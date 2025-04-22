import SwiftUI

struct HygeneView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Personal Hygiene")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Image("sick")
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
                
                Text("Maintaining good personal hygiene in the kitchen is vital for preventing food contamination and ensuring a safe cooking environment, especially when cooking for other people. Ensure you maintain a clean, tidy work aread and always wash your hands thoroughly with warm water and soap for at least 20 seconds before handling food, after touching raw meat, using the restroom, or handling garbage. Never handle food if you are suffering from a fever or symptoms of a cold.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineSpacing(4)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Keep fingernails clean and short to prevent bacteria buildup.")
                    Text("• Avoid wearing rings or bracelets that can trap germs.")
                    Text("• Wear clean clothing and use an apron to protect food.")
                    Text("• Tie back long hair or wear a hairnet to prevent stray hairs in food.")
                    Text("• Avoid touching your face, hair, or phone while cooking, as this can cause bacteria transfer")
                    Text("• If you have a cut or wound, cover it with a waterproof bandage and wear gloves.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                Text("Prevention")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("• Avoid coughing or sneezing near food. If needed, turn away and use a tissue or your elbow.")
                    Text("• Clean your area as you go to ensure no transfer of bacteria from raw or undercooked meats")
                    Text("• Practice these habits to maintain a cleaner kitchen and ensure safe meals for everyone.")
                }
                .font(.body)
                .foregroundColor(.gray)
                .padding(.bottom, 16)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Hygiene Tip")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    Text("Keep hand sanitizer near your kitchen in case soap and water aren’t available, but always wash with soap when possible.")
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
    HygeneView()
}
