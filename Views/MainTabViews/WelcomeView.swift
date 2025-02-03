import SwiftUI

struct WelcomeView: View {
    @Binding var isVisible: Bool
    
    var body: some View {
        if isVisible {
            VStack {
                Spacer()
                VStack(spacing: 20) {
                    Text("Your Ultimate Cooking Guide")
                        .font(.system(size: 40, weight: .medium, design: .default))
                        .foregroundColor(.black.opacity(0.7))
                        .multilineTextAlignment(.center)
                   
                    Text("Master the art of cooking with interactive courses and quizzes.")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .padding(.horizontal, 40)
                        .lineSpacing(6)
                }
                
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
                        .background(Color.blue)
                        .cornerRadius(28)
                        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
                }
                .padding(.horizontal, 40)
                .padding(.top, 20)
                
                Spacer().frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 212/255, green: 231/255, blue: 250/255), // #d4e7fa
                                    Color.white
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .ignoresSafeArea()
                        )
                        .transition(.opacity)
                    }
                }
            }

#Preview {
    WelcomeView(isVisible: .constant(true))
}
