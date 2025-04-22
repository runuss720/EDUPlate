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
    
    init(userProgress: UserProgress) {
        self.userProgress = userProgress
        
        // tools as generic placeholder
        loadQuiz(forCategory: "Tools")
    }
    
    func moveToNextQuestion(concentration: String) {
        
        // check whether quiz is finished or not
        if questionsIndex < questions.count - 1 {
            questionsIndex += 1
        } else {
            isQuizCompleted = true
            userProgress.addPoints(score)
            updateConcentrationProgress(concentration: concentration)
        }
        
        // reset correctness and selected answer states for the next question
        isCorrect = nil
        selectedAnswer = nil
        showNextButton = false
        isAnswerSelected = false
    }
    
    // read questions/answers from JSON file depending on category and present to user
    func loadQuiz(forCategory category: String) {
        guard let url = Bundle.main.url(forResource: "QuestionData", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedQuestions = try decoder.decode([Question].self, from: data)
            self.questions = decodedQuestions.filter { $0.category == category }
        } catch {
            print("ERROR", error)
        }
    }
    
    // handle user's answer and update the score
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
    
    func updateConcentrationProgress(concentration: String) {
        
        // use the score to update concentration progress
        CoreDataManager.shared.updateConcentrationProgress(username: userProgress.username, concentration: concentration, earnedPoints: score)
        print("Updated concentration \(concentration) with \(score) points.")
    }
    
    // fetches random vocabulary words to be used in the stats page
    func fetchRandomQuestion() -> Question? {
        guard let url = Bundle.main.url(forResource: "QuestionData", withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedQuestions = try decoder.decode([Question].self, from: data)
            
            // We're only looking for single word questions to display
            var oneWordQuestions: [Question] = []
            for question in decodedQuestions {
                
                // filter out questions with more than 1 word
                if !(question.question.contains(" ")) {
                    oneWordQuestions.append(question)
                }
            }
            
            // Return a random question from the filtered list
            return oneWordQuestions.randomElement()
        } catch {
            print("Error decoding JSON: ", error)
            return nil
        }
    }
}
