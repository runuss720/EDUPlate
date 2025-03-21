//
//  UserProgress.swift
//  EDUPlate
//
//  Created by Ruby Nuss on 1/26/25.
//
/*
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
}*/
import Foundation

class UserProgress: ObservableObject {
    @Published var currentLevel: Int = 1
    @Published var currentPoints: Int = 0
    @Published var username: String = "" // Store the username
    @Published var password: String = "" // Store the password
    let pointsToLevelUp = 300

    private let coreDataManager = CoreDataManager.shared

    init() {
        loadUserProgress()
    }

    // Fetch user data based on the current username and password
    func fetchUserData() {
        // Guard to prevent unnecessary fetching
        guard !username.isEmpty else {
            print("Username is empty. Skipping fetch.")
            return
        }

        // Fetch user data from Core Data and validate password
        if let user = coreDataManager.fetchUser(username: username, password: password) {
            // Update properties only if they have changed
            if self.currentPoints != Int(user.points) || self.currentLevel != Int(user.level) {
                self.currentPoints = Int(user.points)
                self.currentLevel = Int(user.level)
                print("Fetched user data for \(username): Points = \(currentPoints), Level = \(currentLevel)")
            }
        } else {
            // If no user exists or password is incorrect, create a new one
            resetUserProgress()
            coreDataManager.saveUser(username: username, password: password, points: currentPoints, level: currentLevel)
            print("Created new user profile for \(username)")
        }
    }

    // Reset user progress
    func resetUserProgress() {
        self.currentPoints = 0
        self.currentLevel = 1
    }

    // Update user data when a new username is entered
    func updateUserData(username: String, password: String) {
        self.username = username
        self.password = password
        resetUserProgress() // Reset stats for the new user
        coreDataManager.saveUser(username: username, password: password, points: currentPoints, level: currentLevel) // Save new user profile
        print("Updated user data for \(username)")
    }

    // Load user progress from Core Data
    func loadUserProgress() {
        if let user = coreDataManager.fetchUser(username: username, password: password) {
            self.currentPoints = Int(user.points)
            self.currentLevel = Int(user.level)
            print("Loaded user progress for \(username): Points = \(currentPoints), Level = \(currentLevel)")
        }
    }

    // Add points and check for level up
    func addPoints(_ points: Int) {
        currentPoints += points
        checkLevelUp()
        updateCoreDataUserProgress()
    }

    // Check if the user has leveled up
    func checkLevelUp() {
        while currentPoints >= pointsToLevelUp {
            currentPoints -= pointsToLevelUp
            currentLevel += 1
        }
    }

    // Update user progress in Core Data
    private func updateCoreDataUserProgress() {
        coreDataManager.updateUser(username: username, points: currentPoints, level: currentLevel)
        print("Updated Core Data for \(username): Points = \(currentPoints), Level = \(currentLevel)")
    }
}


