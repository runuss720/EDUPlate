//
//  QuizViewModel.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//

import Foundation
import SwiftUI

struct Quiz: Codable {
    let title: String
    let questions: [Question]
}

struct Question: Codable {
    let question: String
    let options: [String]
    let answer: String
}

class TestManager: ObservableObject {
    @Published var quiz: Quiz?
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var isQuizCompleted: Bool = false
    
    init() {
        loadQuiz()
    }

    func loadQuiz() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("Error: Couldn't find data.json")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedQuiz = try decoder.decode(Quiz.self, from: data)
            self.quiz = decodedQuiz
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }

    func answerQuestion(with option: String) {
        guard let currentQuestion = quiz?.questions[currentQuestionIndex] else { return }

        // Check for correct answer
        if option == currentQuestion.answer {
            score += 1
        }

        // Go to next question until quiz is complete
        if currentQuestionIndex < (quiz?.questions.count ?? 0) - 1 {
            currentQuestionIndex += 1
        } else {
            isQuizCompleted = true
        }
    }
}
