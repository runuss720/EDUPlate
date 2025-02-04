//
//  TestView.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 12/4/24.
//

import SwiftUI

struct TestView: View {
    @StateObject private var viewModel: TestManager
    @ObservedObject var userProgress: UserProgress // Pass UserProgress here
    var category: String

    init(category: String, userProgress: UserProgress) {
        self.category = category
        self.userProgress = userProgress
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

                        Text("Points Awarded: \(viewModel.score)")
                            .font(.title3)
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
                    let currentQuestion = viewModel.questions[viewModel.questionsIndex]

                    // Shuffle the answers
                    let shuffledAnswers = [currentQuestion.answer, currentQuestion.fake1, currentQuestion.fake2, currentQuestion.fake3].shuffled()

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
                                    viewModel.answerQuestion(with: answer)
                                }) {
                                    Text(answer)
                                        .font(.title2)
                                        .padding()
                                        .background(Color.indigo)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                        .padding(.bottom, 10)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.loadQuiz(forCategory: category)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TestView(category: "Tools", userProgress: UserProgress())
}
