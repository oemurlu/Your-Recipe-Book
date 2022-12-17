//
//  CreateRecipeViewController.swift
//  Your-Recipe-App
//
//  Created by Osman Emre Ömürlü on 17.12.2022.
//

import Foundation
import UIKit
import RealmSwift

class CreateRecipeController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ingredientsTextField: UITextView!
    @IBOutlet weak var recipeTextField: UITextView!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let recipe = Recipe()
        
        let name = nameTextField.text!
        let ingredients = ingredientsTextField.text!
        let recipeInput = recipeTextField.text!
        
        recipe.name = name
        recipe.ingredients = ingredients
        recipe.recipe = recipeInput
        
        
        do {
            try realm.write({
                realm.add(recipe)
                navigationController?.popViewController(animated: true)
                
            })
        } catch {
            print("error saving to realm db")
        }
        
        
        
    }
}
