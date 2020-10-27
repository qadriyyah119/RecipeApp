//
//  RecipeSearchResults.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/24/20.
//

import Foundation

struct RecipeSearchResults: Decodable {
  let totalResults: Int
  let results: [RecipeModel]
}
