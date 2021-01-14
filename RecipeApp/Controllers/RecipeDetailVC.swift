//
//  RecipeDetailVC.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/18/20.
//

import UIKit

class RecipeDetailVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let headerID = "headerId"
    fileprivate let titleCell = "titleCell"
    fileprivate let ingredientsCell = "ingredientsCell"
    fileprivate let instructionsCell = "instructionsCell"
    fileprivate let padding: CGFloat = 16
    
    var recipe: RecipeDetailModel!
    let apiClient = ApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        setupCollectionViewLayout()
        setupCollectionView()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        
        // Register cell classes
        self.collectionView!.register(RecipeIngredientsCell.self, forCellWithReuseIdentifier: ingredientsCell)
        self.collectionView!.register(RecipeDetailTitleCell.self, forCellWithReuseIdentifier: titleCell)
        self.collectionView!.register(RecipeInstructionsCell.self, forCellWithReuseIdentifier: instructionsCell)
        self.collectionView!.register(RecipeDetailHeaderV.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
    }
    
    fileprivate func setupCollectionViewLayout() {
        DispatchQueue.main.async { [self] in
            if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
                layout.sectionInset = .init(top: self.padding, left: padding, bottom: padding, right: padding)
            }
        }
        
        // Layout customization
//        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
//        }
    }
    

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! RecipeDetailHeaderV
        if indexPath.section == 0 {
                
        if let imageURL = recipe.image{
          apiClient.downloadRecipeImage(imageURL) {result in
            switch result {
            case .failure(let error):
              print("Photo failure: \(error)")
            case .success(let image):
              DispatchQueue.main.async {
                header.imageView.image = image
              }
            }
          }
        }else {
          header.imageView.image = UIImage(named: "imagePlaceholder")
        }
        } else if indexPath.section == 1 {
            let ingredientsTitle = "INGREDIENTS"
            header.ingredientsTitleLabel.text = ingredientsTitle
        } else if indexPath.section == 2 {
            let instructionsTitle = "INSTRUCTIONS"
            header.instructionsTitleLabel.text = instructionsTitle
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        var headerHeight = CGSize()
        
        if section == 0 {
            headerHeight = CGSize(width: view.frame.width, height: 320)
        } else if section == 1 {
            headerHeight = CGSize(width: view.frame.width, height: 35)
        } else if section == 2 {
            headerHeight = CGSize(width: view.frame.width, height: 35)
        }
        return headerHeight
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var sectionItems = Int()
        
        if section == 0 {
            sectionItems = 1
        } else if section == 1 {
            sectionItems = recipe.nutrition?.ingredients.count ?? 1
        } else if section == 2 {
            sectionItems = 1
//            sectionItems = recipe.analyzedInstructions?[0].steps.count ?? 1
        }
        return sectionItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: titleCell, for: indexPath) as! RecipeDetailTitleCell
        let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: ingredientsCell, for: indexPath) as! RecipeIngredientsCell
        let cellC = collectionView.dequeueReusableCell(withReuseIdentifier: instructionsCell, for: indexPath) as! RecipeInstructionsCell
        
        let section = indexPath.section
    
        if section == 0 {
            if let recipeTitle = recipe.title {
                cellA.recipeTitleLabel.text = recipeTitle
            }
            
            if let recipeCredits = recipe.creditsText {
                
//                cellA.creditsTextLabel.text = "BY \(recipeCredits.uppercased())"
                cellA.creditsTitleButton.setTitle("BY \(recipeCredits.uppercased())", for: .normal)
                
            }
            
            if let recipeServings = recipe.servings {
                cellA.servingsImg.image = UIImage(named: "servingsImg")
                cellA.servingsLabel.text = "\(recipeServings) Servings"
            }
            
            if let recipeTiming = recipe.readyInMinutes {
                cellA.timingImg.image = UIImage(named: "timingImg")
                cellA.timingLabel.text = "\(recipeTiming) Minutes"
            }
            
            cellA.nutrition = recipe.nutrition
    
            cell = cellA
            
        } else if section == 1 {
            
            if recipe.nutrition?.ingredients.count != 0 {
                if let ingredient = recipe.nutrition?.ingredients[indexPath.row] {
                cellB.ingredientsLabel.text = "\(ingredient.amount) \(ingredient.unit) \(ingredient.name)"
            } else {
                cellB.ingredientsLabel.text = "Ingredients Error"
                }
            }
            cell = cellB
        } else if section == 2 {
            cellC.backgroundColor = .white
            
            if let recipeInstructions = recipe.instructions {
                cellC.instructionsTextLabel.text = recipeInstructions
            }
//            if recipe.analyzedInstructions?.count != 0 {
//                if let recipeSteps = recipe.analyzedInstructions?[0].steps[indexPath.row] {
//                    cellC.instructionsStepLabel.text = "Step \(recipeSteps.number)"
//                    cellC.instructionsTextLabel.text = "\(recipeSteps.step)"
//                } else {
//                    cellC.instructionsTextLabel.text = "Instructions Error"
//                }
//            }

            cell = cellC
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var layoutSize = CGSize()
        
        if indexPath.section == 0 {
            layoutSize = CGSize(width: view.frame.width - 2 * padding, height: 235)
        } else if indexPath.section == 1 {
            layoutSize = CGSize(width: view.frame.width - 2 * padding, height: 22)
        } else if indexPath.section == 2 {
            if let instructions = recipe.instructions {
                
                let size = CGSize(width: view.frame.width - 2 * padding, height: 1000)
                let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
                
                let estimatedFrame = NSString(string: instructions).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
                layoutSize = CGSize(width: view.frame.width - 2 * padding, height: estimatedFrame.height)
            }
        }
        return layoutSize
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
//    }

}
