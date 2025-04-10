import SwiftUI
struct LessonView: View {
    @StateObject private var userProgress = UserProgress()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Your Lessons")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .foregroundStyle(.black)
                    
                    LessonManager(filter: 1)
                }
            }
            .padding(.horizontal)
        }
    }
}
