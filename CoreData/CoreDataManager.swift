import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "UserDataModel")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // Save new user data
    func saveUser(username: String, points: Int, level: Int) {
        let user = UserProfile(context: context)
        user.username = username
        user.points = Int64(points)
        user.level = Int64(level)

        saveContext()
    }

    func updateUser(username: String, points: Int, level: Int) {
        if let user = fetchUser(username: username) {
            user.points = Int64(points)
            user.level = Int64(level)
            saveContext()
        }
    }

    // Fetch user data by username
    func fetchUser(username: String) -> UserProfile? {
        let fetchRequest: NSFetchRequest<UserProfile> = UserProfile.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", username) // Filter by username
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            print("Failed to fetch user:", error)
            return nil
        }
    }

    // Save or update concentration progress
    func updateConcentrationProgress(username: String, concentration: String, earnedPoints: Int) {
        let fetchRequest: NSFetchRequest<ConcentrationProgress> = ConcentrationProgress.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@ AND concentration == %@", username, concentration)

        do {
            if let progress = try context.fetch(fetchRequest).first {
                // Update existing concentration progress
                progress.points += Int64(earnedPoints)
            } else {
                // Create a new concentration progress entry
                let newProgress = ConcentrationProgress(context: context)
                newProgress.username = username
                newProgress.concentration = concentration
                newProgress.points = Int64(earnedPoints)
            }
            saveContext()
        } catch {
            print("Failed to fetch concentration progress:", error)
        }
    }

    // Fetch concentration progress
    func fetchConcentrationProgress(username: String) -> [ConcentrationProgress] {
        let fetchRequest: NSFetchRequest<ConcentrationProgress> = ConcentrationProgress.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)

        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch concentration progress:", error)
            return []
        }
    }

    // Save context
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Failed to save context:", error)
        }
    }
}

