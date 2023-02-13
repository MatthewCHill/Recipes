//
//  Recipe.swift
//  Recipes
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class Recipe: Encodable, Decodable {
    let ID: UUID
    var title: String
    var decription: String
    var calories: Int?
    var cookTime: Int?
    
    init(ID: UUID = UUID(), title: String, decription: String, calories: Int?, cookTime: Int?) {
        self.ID = ID
        self.title = title
        self.decription = decription
        self.calories = calories
        self.cookTime = cookTime
    }
    
} // End of class
extension Recipe: Equatable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        return lhs.ID == rhs.ID
    }
    
    
}
