//
//  RecipeCategoryController.swift
//  Recipes
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class RecipeCategoryController {
    
    // MARK: - Properties
    static let sharedInstance = RecipeCategoryController()
    // MARK: - Source Of Truth
    var categories: [RecipeCategory] = []
    
    // MARK: - Crud
    
    func createCategory(with name: String) {
        let category = RecipeCategory(title: name)
        categories.append(category)
        save()
    }
    
    func updateCategory(categoryToUpdate: RecipeCategory, newTitle: String) {
        categoryToUpdate.title = newTitle
        save()
    }
    
    func delete(category categoryToDelete: RecipeCategory) {
        guard let index = categories.firstIndex(of: categoryToDelete) else {return}
        categories.remove(at: index)
        save()
    }
    
    // Computed Property
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalURL = documentsDirectory.appendingPathComponent("recipes.json")
        return finalURL
    }
    
    func save() {
        // 1. Get the address to save the file to
        guard let saveLocation = fileURL else {return}
        // 2. Convert the swift struct or class into JSON Data
        do {
            let jsonData = try JSONEncoder().encode(categories)
            // 3. Save(write) the data to the address from step 1
            try jsonData.write(to: saveLocation)
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    func load() {
        // 1. get the url you to to load data from
        guard let url = fileURL else {return}
        // 2. load the json data from that url
        do {
            let retrievedJsonData = try Data(contentsOf: url)
            // 3. Convert the json data into swift model object type
            let decodedCategories = try JSONDecoder().decode([RecipeCategory].self, from: retrievedJsonData)
            self.categories = decodedCategories
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
} // End of Class
