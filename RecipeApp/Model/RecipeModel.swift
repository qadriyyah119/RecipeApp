//
//  Recipe.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/21/20.
//

import Foundation

struct RecipeModel: Decodable {
  let id: Int
  let title: String
  let readyInMinutes: Int
  let image: String?
}
