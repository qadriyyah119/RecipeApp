//
//  RecipesViewController.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 10/21/20.
//

import UIKit

class RecipesViewController: UICollectionViewController{
  
  @IBOutlet weak var SearchRecipesBtn: UIBarButtonItem!
    
  private let reuseIdentifier = "RecipeCell"
  let apiClient = ApiClient()
  var recipes = [RecipeModel]()
  private let itemsPerRow: CGFloat = 2
  
  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "RecipeCell")
        
        navigationItem.backButtonTitle = ""
//        navigationController?.navigationBar.tintColor = Theme.tintColor
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    apiClient.loadRandomRecipes(10) { (result) in
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
  }
  
    @IBAction func SearchRecipesBtn(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "RecipeSearch", bundle: nil)
        if let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchVCID") as? SearchViewController {
            self.navigationController?.pushViewController(searchVC, animated: true)
        }
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
      } else {
        cell.imageView.image = UIImage(named: "imagePlaceholdeer")
      }
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeId = recipes[indexPath.row].id
        
        apiClient.searchRecipeById(recipeId) {(result) in
        switch result {
        case .failure(let error):
            print("Error loading: \(error)")
        case .success(let recipes):
            print(recipes)
            DispatchQueue.main.async {
            let detailVC = RecipeDetailVC(collectionViewLayout: UICollectionViewFlowLayout())
            detailVC.recipe = recipes
            self.navigationController?.pushViewController(detailVC, animated: true)
                }
            }
        }
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

}

extension RecipesViewController: UICollectionViewDelegateFlowLayout {
  
  //1 responsible for telling the layout the size of a given cell
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //2
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    let heightPerItem = widthPerItem + 7
    
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
