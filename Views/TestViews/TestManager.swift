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

// user scores will be stored
struct Score: Codable {
    let score: Int
    let date: Date
}

class TestManager: ObservableObject {
    
    // all questions stored in array for ease of use
    @Published var questions: [Question] = []
    @Published var questionsIndex: Int = 0
    @Published var score: Int = 0
    @Published var isQuizCompleted: Bool = false
    
    @ObservedObject var userProgress: UserProgress
    
    // used for accessing json file
    private let fileManager = FileManagerHelper()
    private let scoreFileName = "userScores.json"
    
    init(userProgress: UserProgress) {
            self.userProgress = userProgress
            loadQuiz(forCategory: "Tools")
        }

    // read questions/answers from json file depending on category and present to user
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
    
    // function for handling individual questions
    func answerQuestion(with option: String) {
        let currentQuestion = questions[questionsIndex]
        
        // check if user got question correct and increment score
        if option == currentQuestion.answer {
            score += 1
        }

        // check for end of quiz
        if questionsIndex < questions.count - 1 {
            questionsIndex += 1
        } else {
            isQuizCompleted = true
            userProgress.addPoints(score)
            saveScore()
        }
    }
    
    // save the score/date and append to json file
    // edit: also saves user points
    func saveScore() {
        let newScore = Score(score: score, date: Date())
        fileManager.appendScoreToFile(newScore)
    }

    // Load saved scores from the file
    func loadSavedScores() -> [Score] {
        return fileManager.loadScoresFromFile()
    }
}
