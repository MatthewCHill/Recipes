//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Matthew Hill on 2/14/23.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var calorieLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Helper Functions
    func updateViews() {
        nameLabel.text = recipe.title
        calorieLabel.text = "\(recipe.calories ?? 0)"
        
    }
    
    // MARK: - Action
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
    }
    
}

