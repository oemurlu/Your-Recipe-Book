//
//  ViewController.swift
//  Your-Recipe-App
//
//  Created by Osman Emre Ömürlü on 17.12.2022.
//

import UIKit
import RealmSwift

class RecipesViewController: UIViewController {
    
    
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var placeholder: UIImageView!
    
    let realm = try! Realm()
    var recipes: Results<Recipe>?
    var chosenRecipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        recipesTableView.register(UINib(nibName: "RecipeViewCell", bundle: nil), forCellReuseIdentifier: "reusableRecipeViewCell")
        
        getRecipesFromDb()
        
        self.navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 0.21, blue: 0.28, alpha: 1)
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recipesTableView.reloadData()
        
        if self.recipesTableView.numberOfRows(inSection: 0) > 0 {
            placeholder.isHidden = true
        }
    }
    
    func getRecipesFromDb() {
        recipes = realm.objects(Recipe.self)
        DispatchQueue.main.async {
            self.recipesTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.recipe = chosenRecipe
        }
    }
}

extension RecipesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableRecipeViewCell", for: indexPath) as! RecipeViewCell
        
        if let recipe = recipes?[indexPath.row] {
            cell.nameLabel.text = recipe.name
            cell.recipeLabel.text = recipe.recipe
        }
        return cell
    }
    
    
}

extension RecipesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenRecipe = recipes?[indexPath.row]
        self.performSegue(withIdentifier: "goToDetailsVC", sender: nil)
    }
}

    

