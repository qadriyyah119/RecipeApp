//
//  RecipesViewController.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/21/20.
//

import UIKit

class RecipesViewController: UICollectionViewController, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating{
  
  private let reuseIdentifier = "RecipeCell"
  let apiClient = ApiClient()
  var recipes = [RecipeModel]()
  var searches: [RecipeModel] = []
  var recipeDetails: RecipeDetailModel!
  private let itemsPerRow: CGFloat = 2
  
  //initializing UISearchController with nil, I'm telling the search controller that I'm using the same view to search and display the results
  let searchController = UISearchController(searchResultsController: nil)
  
  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "RecipeCell")

        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        
        searchController.searchBar.placeholder = "Search Recipes"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    apiClient.loadRandomRecipes(9) { (result) in
      switch result {
      case .failure(let error):
        print("Error loading: \(error)")
      case .success(let recipes):
        print("Found \(recipes.count) recipes")
        self.recipes = recipes
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    }
    
    apiClient.searchRecipeById(479101) {(result) in
    switch result {
    case .failure(let error):
        print("Error loading: \(error)")
    case .success(let recipes):
        print(recipes)
        //self.recipes = recipes
    }
    }
  }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
  
  var isSearchBarEmpty: Bool {
    return searchController.searchBar.text?.isEmpty ?? true
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "showRecipeDetail",
//              let recipeCell = sender as? RecipePhotoCell,
//              let recipeDetailController = segue.destination as? RecipeDetailViewController,
//              let indexPath = collectionView.indexPath(for: recipeCell),
//              let recipe
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
      return recipes.count
      
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipePhotoCell
      
      let randomRecipe = recipes[indexPath.row]
        
      if let title = randomRecipe.title {
        cell.recipeTitleLabel.text = title
      }
      if let imageURL = randomRecipe.image{
        apiClient.downloadRecipeImage(imageURL) {result in
          switch result {
          case .failure(let error):
            print("Photo failure: \(error)")
          case .success(let image):
            DispatchQueue.main.async {
              cell.imageView.image = image
            }
          }
        }
      }else {
        cell.imageView.image = UIImage(named: "imagePlaceholdeer")
      }
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeId = recipes[indexPath.row]
        
        let detailVC = RecipeDetailViewController()
        detailVC.recipe = recipeId
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
  
  
  func searchText(_ searchText: String) {
    apiClient.search(searchText) { (result) in
      switch result {
      case .failure(let error):
        print("Error Searching: \(error)")
      case .success(let recipes):
        print("Found \(recipes.count) matching \(searchText)")
        self.searches.insert(contentsOf: recipes, at: 0)
        
//        DispatchQueue.main.async{
//        self.collectionView?.reloadData()
//        }
      }
    }
  }
  
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    searchText(searchBar.text!)
  }

}

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
  
  //1 responsible for telling the layout the size of a given cell
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //2
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    let heightPerItem = widthPerItem + 3
    
    return CGSize(width: widthPerItem, height: heightPerItem)
  }
  
  //3 returns the spacing between the cells, headers, and footers
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  //4 controls the spacing between each line in the layout. Matches the padding at left and right
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
}
