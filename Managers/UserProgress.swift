//
//  UserProgress.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 1/26/25.
//

import Foundation

class UserProgress: ObservableObject {
    @Published var currentLevel: Int = 1
    @Published var currentPoints: Int = 0
    private let pointsToLevelUp = 300

    func addPoints(_ points: Int) {
        currentPoints += points
        checkLevelUp()
    }

    func checkLevelUp() {
        while currentPoints >= pointsToLevelUp {
            currentPoints -= pointsToLevelUp
            currentLevel += 1
        }
    }
}

