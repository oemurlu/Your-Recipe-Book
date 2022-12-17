//
//  DetailsViewController.swift
//  Your-Recipe-App
//
//  Created by Osman Emre Ömürlü on 17.12.2022.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    
    var recipe: Recipe?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }


}
