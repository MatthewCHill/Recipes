//
//  RecipeController.swift
//  Recipes
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class RecipeController {
    
    
    
    
    // MARK: - CRUD Functions
    func createRecipe(category: RecipeCategory) {
        let recipe = Recipe(title: "Untitled Recipe", decription: "Recipe Description", calories: 0, cookTime: 0)
        category.recipes.append(recipe)
        RecipeCategoryController.sharedInstance.save()
    }
    
    func update(recipe: Recipe, newTitle: String, newDesc: String, newCal: Int, newCookTime: Int) {
        recipe.title = newTitle
        recipe.decription = newDesc
        recipe.calories = newCal
        recipe.cookTime = newCookTime
        RecipeCategoryController.sharedInstance.save()
        
    }
    
    func delete(recipe: Recipe, from category: RecipeCategory) {
        guard let index = category.recipes.firstIndex(of: recipe) else {return}
        category.recipes.remove(at: index)
        RecipeCategoryController.sharedInstance.save()
    }
    
} // End of class
