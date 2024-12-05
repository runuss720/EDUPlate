//
//  TestView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 12/4/24.
//

import SwiftUI

struct TestView: View {
    @StateObject private var viewModel = TestManager()
    
    var category: String
    var body: some View {
        VStack {
            if !viewModel.questions.isEmpty {
                if viewModel.isQuizCompleted {
                    
                    // Show quiz results after completion
                    VStack {
                        Text("Quiz Completed!")
                            .font(.largeTitle)
                            .padding()

                        Text("Your Score: \(viewModel.score)/\(viewModel.questions.count)")
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
                    
                    // future me fix button sizes
                    // Show current question and answers
                    let currentQuestion = viewModel.questions[viewModel.questionsIndex]
                    VStack {
                        Text(currentQuestion.category)
                            .font(.title)
                            .padding()

                        Text(currentQuestion.question)
                            .font(.headline)
                            .padding()

                        VStack {
                            Button(action: {
                                viewModel.answerQuestion(with: currentQuestion.answer)
                            }) {
                                Text(currentQuestion.answer)
                                    .font(.title2)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.bottom, 10)
                            }

                            Button(action: {
                                viewModel.answerQuestion(with: currentQuestion.fake1)
                            }) {
                                Text(currentQuestion.fake1)
                                    .font(.title2)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.bottom, 10)
                            }

                            Button(action: {
                                viewModel.answerQuestion(with: currentQuestion.fake2)
                            }) {
                                Text(currentQuestion.fake2)
                                    .font(.title2)
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                    .padding(.bottom, 10)
                            }

                            Button(action: {
                                viewModel.answerQuestion(with: currentQuestion.fake3)
                            }) {
                                Text(currentQuestion.fake3)
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
            }
        }
        .onAppear {
            
            // Load quiz for the given category when the view appears
            viewModel.loadQuiz(forCategory: category)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TestView(category: "Tools")
}
