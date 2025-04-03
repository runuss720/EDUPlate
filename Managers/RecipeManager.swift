import SwiftUI

// used to display all available recipes as buttons the user can click on
struct RecipeManager: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                
                // display full list of Recipes
                NavigationLink(destination: SalmonRecipe()) {
                    RecipeCard(title: "Salmon")
                }
                
                NavigationLink(destination: MangoSalsaRecipe()) {
                    RecipeCard(title: "Mango Salsa")
                }
                
                NavigationLink(destination: ScallopsRecipe()) {
                    RecipeCard(title: "Seared Scallops")
                }
                
                NavigationLink(destination: GarlicBreadGrilledCheeseRecipe()) {
                    RecipeCard(title: "Garlic Bread Grilled Cheese")
                }
                
                NavigationLink(destination: SpinachOrzoRecipe()) {
                    RecipeCard(title: "Spinach Orzo")
                }
                
                NavigationLink(destination: BrusselSaladRecipe()) {
                    RecipeCard(title: "Brussel Salad")
                }
            }
        }
    }
    
    // Displays an individual recipe
    struct RecipeCard: View {
        let title: String
        var body: some View {
            VStack {
                Text(title)
                    .font(.system(.largeTitle, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.leading, 20)
                Spacer()
            }
            .frame(width: 350, height: 90)
            .background(Color(red: 0.6, green: 0.7, blue: 1.1))
            .cornerRadius(20)
        }
    }
}
