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
    let concentration: String
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
    let concentration: String
}

class TestManager: ObservableObject {
    
    @Published var questions: [Question] = []
    @Published var questionsIndex: Int = 0
    @Published var score: Int = 0
    @Published var isQuizCompleted: Bool = false
    
    @ObservedObject var userProgress: UserProgress

    // Used for accessing JSON file
    private let fileManager = FileManagerHelper()
    private let scoreFileName = "userScores.json"
    
    init(userProgress: UserProgress) {
        self.userProgress = userProgress
        loadQuiz(forCategory: "Tools")
    }

    // Read questions/answers from JSON file depending on category and present to user
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

    // Handle user's answer and update the score
    func answerQuestion(with option: String, concentration: String) {
        let currentQuestion = questions[questionsIndex]
        
        if option == currentQuestion.answer {
            score += 1
        }

        if questionsIndex < questions.count - 1 {
            questionsIndex += 1
        } else {
            isQuizCompleted = true
            userProgress.addPoints(score)  // Add score to userProgress
            updateUserPointsInCoreData() // Update points and level in Core Data
        }
    }

    // Save score to the file (This code is left as a fallback)
    func saveScore(forConcentration concentration: String) {
        let newScore = Score(score: score, date: Date(), concentration: concentration)
        fileManager.appendScoreToFile(newScore)
        print("Saved score: \(newScore)") // Debugging: Print the saved score
    }

    // Load saved scores from the file (Fallback loading)
    func loadSavedScores() -> [Score] {
        return fileManager.loadScoresFromFile()
    }

    // Update the user's points and level in Core Data directly
    func updateUserPointsInCoreData() {
        if let user = CoreDataManager.shared.fetchUser(username: userProgress.username) {
            let newPoints = Int(user.points) + score // Add the quiz score to the current points
            let newLevel = Int(user.level) + (newPoints / 100) // Example level-up logic: 100 points per level
            
            // Update the user's points and level in Core Data
            CoreDataManager.shared.updateUser(username: userProgress.username, points: newPoints, level: newLevel)
            print("Updated user in Core Data: \(user.username ?? "Unknown") with points: \(newPoints) and level: \(newLevel)")
        } else {
            print("No user found in Core Data.")
        }
    }
}
