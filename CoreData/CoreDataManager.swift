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

    // Update user's points and level
    func updateUser(username: String, points: Int, level: Int) {
        if let user = fetchUser(username: username) {
            user.points = Int64(points)
            user.level = Int64(level)
            saveContext()
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
