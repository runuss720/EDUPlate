import SwiftUI

struct WelcomeView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        if isVisible {
            VStack(spacing: 30) {
                // Title
                VStack(alignment: .leading, spacing: -15) {
                    Text("Edu")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                    Text("Plate")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 80) 

                Text("This app is dedicated to teaching you the basics of cooking.")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.6))
                    .padding(.horizontal, 40)
                    .lineSpacing(4)

                Spacer()
                
                Button(action: {
                    isVisible = false
                }) {
                    Text("Start Your Cooking Journey")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity) // Expands button width
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .stroke(Color.black, lineWidth: 3)
                        )
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                ZStack {
                    Image("vertical-graphic-illustration-blue-purple-circles-light-blue-background")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 8)
                        .ignoresSafeArea()
                    
                    Color.white.opacity(0.3) // lighten background
                        .ignoresSafeArea()
                }
            )
        }
    }
}

#Preview {
    WelcomeView(isVisible: .constant(true))
}


