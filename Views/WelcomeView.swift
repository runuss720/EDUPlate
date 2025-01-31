/*import SwiftUI

struct WelcomeView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        if isVisible {
            VStack(spacing: 30) {
                // Title
                VStack(alignment: .leading, spacing: -15) {
                    Text("Edu")
                        .font(.system(size: 100, weight: .bold))
                    Text("Plate")
                        .font(.system(size: 100, weight: .bold))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                .padding(.top, 80) 

              /* Text("This app is dedicated to teaching you the basics of cooking. Complete courses and take quizzes to level up your cooking knowledge")
                    .font(.system(size: 18, weight: .medium, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.9))
                    .padding(.horizontal, 40)
                    .lineSpacing(4)
*/
                Spacer()
                
                Button(action: {
                    isVisible = false
                }) {
                    Text("Start Your Cooking Journey")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity) // Expands button width
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .fill(Color.white)
                                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 28, style: .continuous)
                                .stroke(Color.white, lineWidth: 3)
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
                    
                    Color.white.opacity(0.4) // lighten background
                        .ignoresSafeArea()
                }
            )
        }
    }
}

#Preview {
    WelcomeView(isVisible: .constant(true))
}

*/
import SwiftUI

struct WelcomeView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        if isVisible {
            VStack(spacing: 20) {
                // Title
                VStack(alignment: .leading, spacing: 0) {
                    Text("EduPlate")
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(.black.opacity(0.9))
                }
                .padding(.top, 80)
                
                // Subtitle
                Text("Master the art of cooking with interactive courses and quizzes.")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.horizontal, 40)
                    .lineSpacing(6)
                
                Spacer()
                
                // Button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isVisible = false
                    }
                }) {
                    Text("Start Cooking")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing)
                                .cornerRadius(28)
                        )
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                Color.white
                    .ignoresSafeArea()
            )
            .transition(.opacity) // Smooth fade transition
        }
    }
}

#Preview {
    WelcomeView(isVisible: .constant(true))
}
