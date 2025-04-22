import SwiftUI

struct TestView: View {
    @StateObject private var viewModel: TestManager
    @ObservedObject var userProgress: UserProgress
    
    // name of test
    var category: String
    
    // area of study ex) "International Terms"
    var concentration: String
    
    // for navigating the test/questions
    @State private var selectedAnswer: String? = nil
    @State private var isCorrect: Bool? = nil
    @State private var showNextButton: Bool = false
    @State private var shuffledAnswers: [String] = []
    
    @Environment(\.presentationMode) var presentationMode
    
    init(category: String, userProgress: UserProgress, concentration: String) {
        self.category = category
        self.userProgress = userProgress
        self.concentration = concentration
        _viewModel = StateObject(wrappedValue: TestManager(userProgress: userProgress))
    }
    
    var body: some View {
        VStack {
            
            // wait for questions to load in
            if !viewModel.questions.isEmpty {
                
                // check if quiz has completed and show completion screen
                if viewModel.isQuizCompleted {
                    
                    VStack {
                        Text("Quiz Completed!")
                            .font(.largeTitle)
                            .padding()
                        
                        // display number of correct answers out of total
                        Text("Your Score: \(viewModel.score)/\(viewModel.questions.count)")
                            .font(.title2)
                            .padding()
                        
                        // return to home screen
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
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
                    
                    // display category, current question and shuffled answer choices
                    ZStack(alignment: .bottom) {
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
                                        if !viewModel.isAnswerSelected {
                                            viewModel.answerQuestion(with: answer, concentration: concentration)
                                        }
                                    }) {
                                        
                                        // answer turns green if correct, red if false
                                        Text(answer)
                                            .font(.title2)
                                            .padding()
                                            .background(answer == viewModel.selectedAnswer ?
                                                        (viewModel.isCorrect == true ? Color.green : Color.red) : Color.indigo)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                            .padding(.bottom, 10)
                                    }
                                    
                                    // Disable the button if an answer has already been selected
                                    // no cheating allowed
                                    .disabled(viewModel.isAnswerSelected)
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
                                shuffleAnswers()
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
                            .padding(.bottom, 20)
                        }
                    }
                }
            } else {
                
                // if this happens app has usually crashed
                ProgressView("Loading Quiz...")
                    .font(.title2)
                    .padding()
            }
        }
        .onAppear {
            viewModel.loadQuiz(forCategory: category)
            shuffleAnswers()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // make sure answer choices don't show up in same order by shuffling
    private func shuffleAnswers() {
        let currentQuestion = viewModel.questions[viewModel.questionsIndex]
        shuffledAnswers = [currentQuestion.answer, currentQuestion.fake1, currentQuestion.fake2, currentQuestion.fake3].shuffled()
    }
}

#Preview {
    TestView(category: "Tools", userProgress: UserProgress(), concentration: "Food Preparation")
}
