//
//  RecipeSearchResults.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/24/20.
//

import Foundation

struct RecipeSearchResults: Decodable {
  var totalResults: Int
  var results: [RecipeModel]
  
  mutating func addResults(result: [RecipeModel]){
    results.append(contentsOf: result)
  }
}
