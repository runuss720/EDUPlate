import SwiftUI

struct TestView: View {
    @StateObject private var viewModel: TestManager
    @ObservedObject var userProgress: UserProgress // Pass UserProgress here
    var category: String
    var concentration: String

    @State private var selectedAnswer: String? = nil
    @State private var isCorrect: Bool? = nil
    @State private var showNextButton: Bool = false
    @State private var shuffledAnswers: [String] = []  // Initialize here

    @Environment(\.presentationMode) var presentationMode

    init(category: String, userProgress: UserProgress, concentration: String) {
        self.category = category
        self.userProgress = userProgress
        self.concentration = concentration
        _viewModel = StateObject(wrappedValue: TestManager(userProgress: userProgress))
    }

    var body: some View {
        VStack {
            if !viewModel.questions.isEmpty {
                if viewModel.isQuizCompleted {
                    VStack {
                        Text("Quiz Completed!")
                            .font(.largeTitle)
                            .padding()

                        Text("Your Score: \(viewModel.score)/\(viewModel.questions.count)")
                            .font(.title2)
                            .padding()

                        Button(action: {
                            presentationMode.wrappedValue.dismiss() // Dismiss the current view to go back
                        }) {
                            Text("Return")
                                .font(.title2)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.indigo.opacity(0.2))
                                .cornerRadius(10)
                                .foregroundColor(.indigo)
                        }
                    }
                    .padding()
                } else {
                    let currentQuestion = viewModel.questions[viewModel.questionsIndex]

                    ZStack(alignment: .bottom) { // Use ZStack to overlay the "Next" button
                        VStack {
                            Text(currentQuestion.category)
                                .font(.title)
                                .padding()

                            Text(currentQuestion.question)
                                .font(.headline)
                                .padding()

                            VStack {
                                ForEach(shuffledAnswers, id: \.self) { answer in
                                    Button(action: {
                                        if !viewModel.isAnswerSelected {  // Only allow answer selection if no answer has been selected
                                            viewModel.answerQuestion(with: answer, concentration: concentration)
                                        }
                                    }) {
                                        Text(answer)
                                            .font(.title2)
                                            .padding()
                                            .background(answer == viewModel.selectedAnswer ?
                                                         (viewModel.isCorrect == true ? Color.green : Color.red) : Color.indigo)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                            .padding(.bottom, 10)
                                    }
                                    .disabled(viewModel.isAnswerSelected)  // Disable the button if an answer has already been selected
                                }
                            }

                            // Feedback message for the answer
                            if let isCorrect = viewModel.isCorrect {
                                Text(isCorrect ? "Correct!" : "Incorrect")
                                    .font(.headline)
                                    .foregroundColor(isCorrect ? .green : .red)
                                    .padding()
                            }
                        }
                        .padding()

                        // Overlay the "Next" button at the bottom
                        if viewModel.showNextButton {
                            Button(action: {
                                viewModel.moveToNextQuestion(concentration: concentration)
                                shuffleAnswers()  // Shuffle answers for the next question
                            }) {
                                Text("Next")
                                    .font(.title2)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.indigo)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 20) // Add some padding at the bottom
                        }
                    }
                }
            } else {
                ProgressView("Loading Quiz...") // Show a loading indicator while questions are being loaded
                    .font(.title2)
                    .padding()
            }
        }
        .onAppear {
            viewModel.loadQuiz(forCategory: category) // Load quiz questions when the view appears
            shuffleAnswers()  // Shuffle answers when the view appears
        }
        .navigationBarBackButtonHidden(true)
    }

    private func shuffleAnswers() {
        guard !viewModel.questions.isEmpty else { return }
        let currentQuestion = viewModel.questions[viewModel.questionsIndex]
        shuffledAnswers = [currentQuestion.answer, currentQuestion.fake1, currentQuestion.fake2, currentQuestion.fake3].shuffled()
    }
}

#Preview {
    TestView(category: "Tools", userProgress: UserProgress(), concentration: "Food Preparation")
}
