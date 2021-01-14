//
//  SearchResultsViewController.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 12/24/20.
//

import UIKit



class SearchResultsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let recipeCell = "recipeCell"
    
    let apiClient = ApiClient()
    var recipes = [RecipeModel]()
    var searchQuery: String! //talk to marquis about force unwrapping this
    var searchedRecipes = [RecipeSearchResults]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Results"
        
        setupCollectionView()
        
        apiClient.search(searchQuery) { (result) in
            switch result {
            case .failure(let error):
                print("Error searching: \(error)")
            case .success(let recipes):
                print("Found \(recipes.count) recipes")
                self.recipes = recipes
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        // Register cell classes
        self.collectionView!.register(RecipeSearchResultsCell.self, forCellWithReuseIdentifier: recipeCell)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return recipes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeCell, for: indexPath) as! RecipeSearchResultsCell
    
        let searchRecipes = recipes[indexPath.row]
        cell.recipeTitleLabel.text = searchRecipes.title
        
//        if let imageURL = searchRecipes.image {
//            apiClient.downloadRecipeImage(imageURL) {result in
//              switch result {
//              case .failure(let error):
//                print("Photo failure: \(error)")
//              case .success(let image):
//                DispatchQueue.main.async {
//                  cell.imageView.image = image
//                }
//              }
//            }
//        } else {
//            cell.imageView.image = UIImage(named: "imagePlaceholdeer")
//          }
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

    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var layoutSize = CGSize()
        
        layoutSize = CGSize(width: view.frame.width, height: 235)
        
        return layoutSize
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

