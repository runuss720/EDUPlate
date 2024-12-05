//
//  QuizViewModel.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 11/18/24.
//

import Foundation
import SwiftUI

struct Quiz: Codable {
    let category: String
    let questions: [Question]
}

// all questions are separated by category ex) "tools", "french terms"
struct Question: Codable {
    let category: String
    let question: String
    let answer: String
    let fake1: String
    let fake2: String
    let fake3: String
}

class TestManager: ObservableObject {
    @Published var questions: [Question] = []
    @Published var questionsIndex: Int = 0
    @Published var score: Int = 0
    @Published var isQuizCompleted: Bool = false
    
    private let scoreKey = "userScores"
    
    init() {
       // loadScore()
        //resetScore()  // Reset score on app launch
        loadQuiz(forCategory: "Tools")
    }

    func loadScore() {
           // Load the saved score from UserDefaults (if available)
           if let savedScores = UserDefaults.standard.array(forKey: scoreKey) as? [Int], let lastScore = savedScores.last {
               score = lastScore  // Use the last score from UserDefaults
           }
       }
    
    func resetScore() {
        print("score before reset = ", score)
        score = 0  // Reset score on initialization
    }

    func loadQuiz(forCategory category: String) {
        guard let url = Bundle.main.url(forResource: "f5", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedQuestions = try decoder.decode([Question].self, from: data)
            
            self.questions = decodedQuestions.filter { $0.category == category }
        } catch {
            print("Error decoding JSON")
        }
    }

    func answerQuestion(with option: String) {
        let currentQuestion = questions[questionsIndex]
        if option == currentQuestion.answer {
            score += 1
        }

        if questionsIndex < questions.count - 1 {
            questionsIndex += 1
        } else {
            isQuizCompleted = true
            saveScore()
            print("saving score, score = ", score)
        }
    }

    func saveScore() {
        var savedScores = loadSavedScores()
        savedScores.append(score)  // Add the score to the list
        UserDefaults.standard.set(savedScores, forKey: scoreKey)  // Save to UserDefaults
    }

    func loadSavedScores() -> [Int] {
        return UserDefaults.standard.array(forKey: scoreKey) as? [Int] ?? []
    }
}

