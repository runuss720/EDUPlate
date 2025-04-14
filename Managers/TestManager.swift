import Foundation
import SwiftUI

struct Quiz: Codable {
    let category: String
    let questions: [Question]
    let concentration: String
}

// all questions are separated by category ex) "tools", "french terms"
// fake 1/2/3 are random answers, real one is "answer"
struct Question: Codable {
    let category: String
    let question: String
    let answer: String
    let fake1: String
    let fake2: String
    let fake3: String
}

// user scores will be stored, along with date and concentration of quiz
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
    @Published var isCorrect: Bool? = nil
    @Published var selectedAnswer: String? = nil
    @Published var showNextButton: Bool = false
    @Published var isAnswerSelected: Bool = false
    
    @ObservedObject var userProgress: UserProgress
    
    // Used for accessing JSON file
    private let fileManager = FileManagerHelper()
    private let scoreFileName = "userScores.json"
    
    init(userProgress: UserProgress) {
        self.userProgress = userProgress
        loadQuiz(forCategory: "Tools")
    }
    
    func moveToNextQuestion(concentration: String) {
        if questionsIndex < questions.count - 1 {
            questionsIndex += 1
        } else {
            isQuizCompleted = true
            userProgress.addPoints(score)
            updateConcentrationProgress(concentration: concentration)
        }
        
        // Reset correctness and selected answer states for the next question
        isCorrect = nil
        selectedAnswer = nil
        showNextButton = false
        isAnswerSelected = false  
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
            isCorrect = true
        } else {
            isCorrect = false
        }
        
        selectedAnswer = option
        showNextButton = true
        isAnswerSelected = true
    }
    
    // Save score to the file (This code is left as a fallback)
    func saveScore(forConcentration concentration: String) {
        let newScore = Score(score: score, date: Date(), concentration: concentration)
        fileManager.appendScoreToFile(newScore)
        //print("Saved score: \(newScore)")
    }
    
    // Load saved scores from the file (Fallback loading)
    func loadSavedScores() -> [Score] {
        return fileManager.loadScoresFromFile()
    }
    
    func updateConcentrationProgress(concentration: String) {
        
        // Directly use the score to update concentration progress
        CoreDataManager.shared.updateConcentrationProgress(username: userProgress.username, concentration: concentration, earnedPoints: score)
        print("Updated concentration \(concentration) with \(score) points.")
    }
    
    // fetches random vocabulary words to be used in the stats page
    func fetchRandomQuestion() -> Question? {
        guard let url = Bundle.main.url(forResource: "f5", withExtension: "json") else {
            print("Failed to locate f5.json in bundle")
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedQuestions = try decoder.decode([Question].self, from: data)
            
            // Filter questions to include only those with one word
            let oneWordQuestions = decodedQuestions.filter { question in
                
                // Check if the question contains no spaces
                !question.question.contains(" ")
            }
            
            // Return a random question from the filtered list
            return oneWordQuestions.randomElement()
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }
}
