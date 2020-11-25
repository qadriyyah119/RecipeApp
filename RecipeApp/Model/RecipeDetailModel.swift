//
//  RecipeDetailModel.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/10/20.
//

import Foundation

struct RecipeDetailModel: Decodable {
    let creditsText: String?
    let id: Int
    let title: String?
    let readyInMinutes: Int?
    let servings: Int?
    let sourceUrl: String?
    let image: String?
    let nutrition: Nutrition?
    let dishTypes: [String]?
    let instructions: String
}

struct Nutrition: Decodable {
    let nutrients: [Nutrients]
    let ingredients: [Ingredients]
}

struct Nutrients: Decodable {
    let title: String
    let amount: Float
}

struct Ingredients: Decodable {
    let name: String
    let amount: Float
    let unit: String
}
