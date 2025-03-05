//
//  FileManagerHelper.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 12/5/24.
//

import Foundation

class FileManagerHelper {
    
    // Append a new score to the file (or create the file if it doesn't exist)
    func appendScoreToFile(_ score: Score) {
        let fileURL = ScoresFileURL()
        
        // Load existing scores and append the new score
        var existingScores = loadScoresFromFile()
        existingScores.append(score)
        saveScoresToFile(scores: existingScores, fileURL: fileURL)
        
        print("Appended score: \(score)") // Debugging: Print the appended score
    }
    
    // Save an array of scores to the file
    func saveScoresToFile(scores: [Score], fileURL: URL) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(scores)
            try data.write(to: fileURL)
            print("Successfully saved scores to: \(fileURL.path)")
        } catch {
            print("Error saving scores to file: \(error)")
        }
    }
    
    // Load scores from the file
    func loadScoresFromFile() -> [Score] {
        let fileURL = ScoresFileURL()
        
        // Check if the file exists before attempting to load it
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            print("File does not exist at path: \(fileURL.path)") // Debugging: Print file path
            return []
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let scores = try decoder.decode([Score].self, from: data)
            print("Loaded scores: \(scores)") // Debugging: Print loaded scores
            return scores
        } catch {
            print("Error loading scores: \(error)") // Debugging: Print the error
            return []
        }
    }
    
    
    // Get the file URL for the userScores.json file
    func ScoresFileURL() -> URL {
        let fm = FileManager.default
        let documentsURL = fm.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsURL.appendingPathComponent("userScores.json")
        print("File URL: \(fileURL.path)") // Debugging: Print file path
        return fileURL
    }
}
