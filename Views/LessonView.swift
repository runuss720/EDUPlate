import SwiftUI

struct LessonView: View {
    @StateObject private var userProgress = UserProgress()
    @State private var userLevel: Int = 1
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Your Lessons")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .clipped()
                            .padding(.top, 10)
                            .foregroundStyle(.black)
                    }
                    // Display available lessons
                    LessonManager(length: 2)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LessonView()
}
