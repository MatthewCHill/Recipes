//
//  Recipe.swift
//  Recipes
//
//  Created by Matthew Hill on 2/13/23.
//

import Foundation

class Recipe {
    let ID: UUID
    var title: String
    var decription: String
    var calories: Int?
    var cookTime: Int?
    
    init(ID: UUID = UUID(), title: String, decription: String, calories: Int? = nil, cookTime: Int? = nil) {
        self.ID = ID
        self.title = title
        self.decription = decription
        self.calories = calories
        self.cookTime = cookTime
    }
    
} // End of class
