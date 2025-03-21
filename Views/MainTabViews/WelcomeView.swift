import SwiftUI

struct WelcomeView: View {
    @Binding var isVisible: Bool
    @State private var username: String = ""
    @State private var showTextField: Bool = false
    
    @EnvironmentObject var userProgress: UserProgress  // Use EnvironmentObject
    
    @State private var password: String = ""  // New state for password input
    
    @State private var isNewUser: Bool = false  // Flag for new user logic
    @State private var errorMessage: String? = nil  // Error message for invalid username or password
    
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
                
                if showTextField {
                    TextField("Enter your username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 40)
                        .padding(.top, 10)
                    
                    if !isNewUser {  // Check if user is new or existing
                        SecureField("Enter your password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                    } else {
                        SecureField("Create a new password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                            .autocapitalization(.none)  // Disable automatic capitalization
                            .disableAutocorrection(true)  // Disable autocorrection
                            .keyboardType(.default)  // Set keyboard to default type
                    }
                }
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .padding(.top, 10)
                }

                // Login or Create Account button
                Button(action: {
                    if showTextField {
                        if !username.isEmpty {
                            if isNewUser {
                                // New user logic: check if username is already taken
                                if let _ = CoreDataManager.shared.fetchUser(username: username) {
                                    // Username already exists
                                    errorMessage = "Username already taken. Please try again."
                                } else {
                                    // Create new user
                                    // No need for confirm password anymore
                                    if !password.isEmpty {
                                        userProgress.resetUserProgress()
                                        userProgress.updateUserData(username: username, password: password)
                                        CoreDataManager.shared.saveUser(username: username, password: password, points: 0, level: 1)
                                        isVisible = false
                                    } else {
                                        errorMessage = "Password cannot be empty."
                                    }
                                }
                            } else {
                                // Existing user logic: verify username and password
                                if let user = CoreDataManager.shared.fetchUser(username: username, password: password) {
                                    userProgress.resetUserProgress()
                                    userProgress.updateUserData(username: user.username ?? "", password: password)
                                    isVisible = false
                                } else {
                                    errorMessage = "Invalid username or password."
                                }
                            }
                        }
                    } else {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showTextField = true
                        }
                    }
                }) {
                    Text(showTextField ? "Continue" : "Log In")
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
                
                // Create an Account button
                if !isNewUser {
                    Button(action: {
                        withAnimation {
                            isNewUser = true
                            showTextField = true  // Automatically show text fields for username and password
                            errorMessage = nil // Clear any previous error message
                        }
                    }) {
                        Text("Create an Account")
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 10)
                }

                Spacer().frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 212/255, green: 231/255, blue: 250/255),
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
