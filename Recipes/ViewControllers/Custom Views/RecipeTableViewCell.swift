//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Matthew Hill on 2/14/23.
//

import UIKit

// step 1 declare the protocol

protocol RecipeTableViewCellDelegate: AnyObject { //creates my boss
    // step 2 create the protocol methods
    func toggleFavoriteButtonTapped(cell: RecipeTableViewCell) // Creates my task
}
class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var calorieLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    //step 3 hire an intern
    weak var delegate: RecipeTableViewCellDelegate? // creating the clones
    
    var recipe: Recipe? {
        didSet{
        updateViews()
        }
    }
    // MARK: - Helper Functions
    func updateViews() {
        guard let recipe = recipe else {return}
        nameLabel.text = recipe.title
        calorieLabel.text = "\(recipe.calories ?? 0)"
        
        let favoriteImageName = recipe.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
        
    }
    
    // MARK: - Action
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        // step 4 inform the delgate when to perfrom the action
        // Hey clones, excute order 66
        delegate?.toggleFavoriteButtonTapped(cell: self)
    }
    
}

