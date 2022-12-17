//
//  RecipeViewCellTableViewCell.swift
//  Your-Recipe-App
//
//  Created by Osman Emre Ömürlü on 17.12.2022.
//

import UIKit

class RecipeViewCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
