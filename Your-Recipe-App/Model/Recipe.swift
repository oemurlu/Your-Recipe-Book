//
//  Recipe.swift
//  Your-Recipe-App
//
//  Created by Osman Emre Ömürlü on 17.12.2022.
//



import Foundation
import RealmSwift

class Recipe: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var ingredients: String = ""
    @objc dynamic var recipe: String = ""
}


