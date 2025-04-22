import CoreData

// handles user accounts, such as usernames and passwords
// check print messages for testing later
class CoreDataManager {
    
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "UserData")
        persistentContainer.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("Failed to load coredata", error)
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // Save new user data with password and username
    // new users SHOULD start out with 0 points and level 1
    func saveUser(username: String, password: String, points: Int, level: Int) {
        let user = UserProfile(context: context)
        user.username = username
        user.password = password
        user.points = Int64(points)
        user.level = Int64(level)
        
        if (user.points > 0 || user.level > 1) {
            print("ERROR - new user should start with 0 points")
        }
        saveContext()
    }
    
    // updates user data if points change
    func updateUser(username: String, points: Int, level: Int) {
        if let user = fetchUser(username: username) {
            let oldLevel = user.level
            let oldPoints = user.points
            
            if (oldLevel != level) || (oldPoints != points) {
                user.points = Int64(points)
                user.level = Int64(level)
                saveContext()
            }
        }
    }
    
    // verifies password from username
    func fetchUser(username: String, password: String? = nil) -> UserProfile? {
        let fetchRequest: NSFetchRequest<UserProfile> = UserProfile.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                context.refresh(user, mergeChanges: true)
                
                if let password = password, user.password == password {
                    return user
                } else if password == nil {
                    return user
                }
            }
        } catch {
            print("Failed to fetch user:", error)
        }
        return nil
    }
    
    // Save or update concentration progress
    func updateConcentrationProgress(username: String, concentration: String, earnedPoints: Int) {
        let fetchRequest: NSFetchRequest<ConcentrationProgress> = ConcentrationProgress.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@ AND concentration == %@", username, concentration)
        
        do {
            if let progress = try context.fetch(fetchRequest).first {
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
    
    // keep track of concentration data for stats page
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
