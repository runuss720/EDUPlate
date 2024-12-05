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
        
        // load existing scores and append the new score
        var existingScores = loadScoresFromFile()
        existingScores.append(score)
        saveScoresToFile(scores: existingScores, fileURL: fileURL)
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
            return []
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let scores = try decoder.decode([Score].self, from: data)
            return scores
        } catch {
            return []
        }
    }
    
    
    // Get the file URL for the userScores.json file
    func ScoresFileURL() -> URL {
        let fm = FileManager.default
        let documentsURL = fm.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsURL.appendingPathComponent("userScores.json")
    }
}
