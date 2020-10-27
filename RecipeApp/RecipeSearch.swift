//
//  RecipeSearch.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/22/20.
//

import Foundation

enum RecipeError: Error {
  case invalidStatus
  case invalidData
}

class ApiClient {
  
  let apiKey = "jRBEeAvNzEmshaJdjDR1rrUodDmsp19zMKBjsn1TCbzUaP3u2T"
  let host = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
  let scheme = "https"
  
  func loadRandomRecipes(_ number: Int, completion: ((Result<[RecipeModel], RecipeError>) -> Void)?) {
    
    let headers = [
        "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
        "x-rapidapi-key": "jRBEeAvNzEmshaJdjDR1rrUodDmsp19zMKBjsn1TCbzUaP3u2T"
      ]
    
    var randomRecipeURL: URL {
      var components = URLComponents()
      components.scheme = scheme
      components.host = host
      components.path = "/recipes/random"
      components.queryItems = [
        //URLQueryItem(name: "apiKey", value: apiKey),
        URLQueryItem(name: "number", value: "\(number)")
      ]
      
      print(components.url!)
      return components.url!
    }
    
    let request = NSMutableURLRequest(url: randomRecipeURL)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    
    let configuration = URLSessionConfiguration.default
    configuration.waitsForConnectivity = true
    let session = URLSession(configuration: configuration)
    
    let task = session.dataTask(with: request as URLRequest) {
      
      (data, response, error) in
      
      guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        completion?(.failure(RecipeError.invalidStatus))
        return
      }
      
      guard let data = data else {
        completion?(.failure(RecipeError.invalidData))
        
        return
      }
  
      let decoder = JSONDecoder()
      let recipes = try? decoder.decode([RecipeModel].self, from: data)
      completion?(.success(recipes ?? []))
    }
    task.resume()
  }

//  func recipeSearch() {
//
//    let configuration = URLSessionConfiguration.default
//    configuration.waitsForConnectivity = true
//    let session = URLSession(configuration: configuration)
//
//    let url = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?diet=vegetarian&excludeIngredients=coconut&intolerances=egg%252C%20gluten&number=10&offset=0&type=main%20course&query=burger")!
//
//    let task = session.dataTask(with: url) {
//
//      (data, response, error) in
//
//      guard let httpMethod = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//        return
//      }
//
//      guard let data = data else {
//        print("Error info: \(error)")
//      }
//    }
//    task.resume()
//  }
//
//  let headers = [
//    "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
//    "x-rapidapi-key": "jRBEeAvNzEmshaJdjDR1rrUodDmsp19zMKBjsn1TCbzUaP3u2T"
//  ]
//
//  let request = NSMutableURLRequest(url: NSURL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?diet=vegetarian&excludeIngredients=coconut&intolerances=egg%252C%20gluten&number=10&offset=0&type=main%20course&query=burger")! as URL,
//                                    cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
//  request.httpMethod = "GET"
//  request.allHTTPHeaderFields = headers
//
//  let session = URLSession.shared
//  let dataTask = session.dataTask(with: request as URLRequest, completionHandler: {
//                                    (data, response, error) -> Void in
//                                    if (error != nil) {
//                                      print(error)
//
//                                    } else {
//                                      let httpResponse = response as? HTTPURLResponse
//                                      print(httpResponse)
//
//                                    }
//
//  })
//  dataTask.resume()
  
    
}

