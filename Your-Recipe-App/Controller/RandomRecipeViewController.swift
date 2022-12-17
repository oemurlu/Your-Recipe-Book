//
//  RandomRecipeViewController.swift
//  Your-Recipe-App
//
//  Created by Osman Emre Ömürlü on 17.12.2022.
//

import Foundation
import UIKit
import RealmSwift

class RandomViewController: UIViewController {
    
    let realm = try! Realm()
    var recipes: Results<Recipe>?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRecipesFromDb()
    }
    
    func getRecipesFromDb() {
        recipes = realm.objects(Recipe.self)
    }
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        let recipeCount = recipes?.count ?? 0
        
        if recipeCount == 0 {
            nameLabel.text = "Please add recipe"
        } else {
            let randInt = Int.random(in: 0 ..< recipeCount)
            nameLabel.text = recipes?[randInt].name
        }
    }
}
