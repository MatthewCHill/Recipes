//
//  RecipeCategory.swift
//  Recipes
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class RecipeCategory: Encodable, Decodable {
    
    let id: UUID
    var title: String
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), title: String, recipes: [Recipe] = []) {
        self.id = id
        self.title = title
        self.recipes = recipes
    }    
} // End of Class

extension RecipeCategory: Equatable {
    static func == (lhs: RecipeCategory, rhs: RecipeCategory) -> Bool {
        return lhs.id == rhs.id
        
    }
}
