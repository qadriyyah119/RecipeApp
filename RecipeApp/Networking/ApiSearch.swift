//
//  RecipeSearch.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/22/20.
//

import UIKit


enum RecipeError: Error {
  case invalidStatus
  case invalidData
  case decodingError
  case invalidId
}

class ApiClient {
  
  let host = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
  let scheme = "https"
  let headers = [
      "x-rapidapi-host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com",
      "x-rapidapi-key": "jRBEeAvNzEmshaJdjDR1rrUodDmsp19zMKBjsn1TCbzUaP3u2T"
    ]
  
  func loadRandomRecipes(_ number: Int, completion: ((Result<[RecipeModel], RecipeError>) -> Void)?) {
    
    var randomRecipeURL: URL {
      var components = URLComponents()
      components.scheme = scheme
      components.host = host
      components.path = "/recipes/random"
      components.queryItems = [
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
      do {
      let recipes = try decoder.decode(RandomRecipeResults.self, from: data)
        completion?(.success(recipes.recipes))
      } catch let exception {
        print(exception.localizedDescription)
        completion?(.failure(RecipeError.decodingError))
      }
    }
    task.resume()
  }

  func search(_ query: String, completion: ((Result<[RecipeModel], RecipeError>) -> Void)?) {
    var searchURL: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/recipes/search"
        components.queryItems = [
          URLQueryItem(name: "query", value: query)
        ]
        
        print(components.url!)
        return components.url!
      }
      let request = NSMutableURLRequest(url: searchURL)
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
        do{
        let recipes = try decoder.decode(RecipeSearchResults.self, from: data)
          completion?(.success(recipes.results))
        } catch let exception {
          print(exception.localizedDescription)
          completion?(.failure(RecipeError.decodingError))
        }
      }
      task.resume()
    }
    
  func searchRecipeById(_ id: Int, completion: ((Result<RecipeDetailModel, RecipeError>) -> Void)?) {
    var searchByIdURL: URL {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = "/recipes/\(id)/information"
        components.queryItems = [
          URLQueryItem(name: "includeNutrition", value: "true")
        ]
        
        print(components.url!)
        return components.url!
      }
    let request = NSMutableURLRequest(url: searchByIdURL)
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
      do{
      let recipe = try decoder.decode(RecipeDetailModel.self, from: data)
        completion?(.success(recipe))
      } catch let exception {
        print(exception.localizedDescription)
        completion?(.failure(RecipeError.invalidId))
      }
    }
    task.resume()
  }
  
  func downloadRecipeImage(_ imageURL: String, completion:((Result<UIImage?, RecipeError>) -> Void)?) {
    if let url = URL(string: imageURL) {
      let task = URLSession.shared.dataTask(with: url) {
        (data, response, error) in
        
        guard let data = data else {
          completion?(.failure(RecipeError.invalidData))
          return
        }
          completion?(.success(UIImage(data: data)))
      }
      task.resume()
    }
  }
  
  }


