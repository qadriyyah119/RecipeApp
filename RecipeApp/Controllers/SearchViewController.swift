//
//  SearchViewController.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 12/29/20.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let apiClient = ApiClient()
    var recipeSearchSuggestions = [AutoCompleteSearchResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    
        view.backgroundColor = .white
        
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Explore"

    }
    
    func searchedText(_ searchText: String) {
        apiClient.autoCompleteRecipeSearch(searchText) { (result) in
            switch result {
            case .failure(let error):
                print("Error Searching: \(error)")
            case .success(let recipeSearchSuggestions):
                print("Found \(recipeSearchSuggestions.count) matching \(searchText)")
                
            }
        }
        
//        apiClient.search(searchText) { (result) in
//            switch result {
//            case .failure(let error):
//                print("Error Searching: \(error)")
//            case .success(let recipes):
//                print("Found \(recipes.count) matching \(searchText)")
////                self.searchedRecipes.insert(contentsOf: recipes, at: 0)
////                DispatchQueue.main.async {
////                let resultsVC = SearchResultsViewController(collectionViewLayout: UICollectionViewFlowLayout())
////                resultsVC.recipes = recipes
////                self.navigationController?.pushViewController(resultsVC, animated: true)
////                    }
//            }
//        }
    }

}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        apiClient.autoCompleteRecipeSearch(searchText) { (result) in
            switch result {
            case .failure(let error):
                print("Error Searching: \(error)")
            case .success(let recipeSearchSuggestions):
                print("Found \(recipeSearchSuggestions.count) matching \(searchText)")
                self.recipeSearchSuggestions = recipeSearchSuggestions
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
     
 
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.resignFirstResponder()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        return recipeSearchSuggestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "resultsCell", for: indexPath) as? SearchResultsCell else {
            fatalError("Fatal Error Test")
        }
        
//        cell.backgroundColor = .red
        cell.resultsTitleLabel?.text = recipeSearchSuggestions[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultsVC = SearchResultsViewController(collectionViewLayout: UICollectionViewFlowLayout())
        resultsVC.searchQuery = recipeSearchSuggestions[indexPath.row].title
        self.navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    
}
