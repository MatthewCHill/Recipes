//
//  RecipeCategoryTableViewController.swift
//  Recipe1
//
//  Created by Stateful on 10/12/21.
//

import UIKit

class RecipeCategoryTableViewController: UITableViewController {
    
    
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeCategoryController.shared.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCategory", for: indexPath)
        let category = RecipeCategoryController.shared.categories[indexPath.row]
        cell.textLabel?.text = category.title
        cell.detailTextLabel?.text = "\(category.recipes.count) Recipes"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let category = RecipeCategoryController.shared.categories[indexPath.row]
            RecipeCategoryController.shared.delete(category: category)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toRecipeCategoryDetail",
              let categoryDetailViewController = segue.destination as? RecipeTableViewController,
              let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
        let category = RecipeCategoryController.shared.categories[selectedRow]
        categoryDetailViewController.category = category
    }
    
    // MARK: - IBActions
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        RecipeCategoryController.shared.createRecipeCategory()
        let newRow = RecipeCategoryController.shared.categories.count - 1
        let indexPath = IndexPath(row: newRow, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}
