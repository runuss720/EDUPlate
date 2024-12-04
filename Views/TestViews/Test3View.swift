//
//  Test3View.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//

import SwiftUI

struct Test3View: View {
    @StateObject private var viewModel = TestManager()

    var body: some View {
        VStack {
            if let quiz = viewModel.quiz {
                if viewModel.isQuizCompleted {
                    // Show quiz result after completion
                    VStack {
                        Text("Quiz Completed!")
                            .font(.largeTitle)
                            .padding()

                        Text("Your Score: \(viewModel.score)/\(quiz.questions.count)")
                            .font(.title2)
                            .padding()
                        
                        NavigationLink(destination: HomeView()) {
                            Text("Return to Home")
                                .font(.title2)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.pink.opacity(0.2))
                                .cornerRadius(10)
                                .foregroundColor(.pink)
                        }
                    }
                    .padding()
                } else {
                    // Show current question and options
                    let currentQuestion = quiz.questions[viewModel.currentQuestionIndex]
                    VStack {
                        Text(quiz.title)
                            .font(.title)
                            .padding()

                        Text(currentQuestion.question)
                            .font(.headline)
                            .padding()

                        ForEach(currentQuestion.options, id: \.self) { option in
                            Button(action: {
                                viewModel.answerQuestion(with: option)
                            }) {
                                Text(option)
                                    .font(.title2)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.bottom, 10)
                            }
                        }

                        Spacer()
                    }
                    .padding()
                }
            } else {
                // Show loading message while the quiz is being loaded
                ProgressView("Loading Quiz...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
        .onAppear {
            // Start loading the quiz as soon as the view appears
            viewModel.loadQuiz()
        }
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

#Preview {
    Test3View()
}
