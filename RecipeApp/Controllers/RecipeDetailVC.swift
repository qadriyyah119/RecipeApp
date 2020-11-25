//
//  RecipeDetailVC.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/18/20.
//

import UIKit

private let reuseIdentifier = "Cell"

class RecipeDetailVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let headerID = "headerId"
    fileprivate let titleCell = "titleCell"
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

        // Do any additional setup after loading the view.
    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInsetAdjustmentBehavior = .never
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(RecipeDetailTitleCell.self, forCellWithReuseIdentifier: titleCell)
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
        
        if let recipeTitle = recipe.title{
            header.recipeTitleLabel.text = recipeTitle
        }
        
        if let recipeCreditText = recipe.creditsText{
            header.creditsTextLabel.text = recipeCreditText
        }
        
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
          header.imageView.image = UIImage(named: "imagePlaceholdeer")
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 390)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        var sectionItems = Int()
        
        if section == 0 {
            sectionItems = 1
        } else if section == 1 {
        sectionItems = 15
        }
        return sectionItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: titleCell, for: indexPath) as! RecipeDetailTitleCell
        let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let section = indexPath.section
        
        if section == 0 {
            //cellA.backgroundColor = .cyan
            if let nutritionData = recipe.nutrition?.nutrients{
                if let calorieIndex = nutritionData.firstIndex(where: {$0.title == "Calories"}) {
                    let calorieAmount = nutritionData[calorieIndex].amount
                    cellA.calorieTextView.text = """
                        \(calorieAmount)
                        Calories
                        """
                }
                if let carbsIndex = nutritionData.firstIndex(where: { $0.title == "Carbohydrates"}) {
                    let carbAmount = nutritionData[carbsIndex].amount
                    cellA.carbsTextView.text = """
                        \(carbAmount)
                        Carbs
                        """
                }
                if let proteinIndex = nutritionData.firstIndex(where: { $0.title == "Protein"}) {
                    let proteinAmount = nutritionData[proteinIndex].amount
                    cellA.proteinTextView.text = """
                        \(proteinAmount)
                        Protein
                        """
                }
                if let fatIndex = nutritionData.firstIndex(where: { $0.title == "Fat"}) {
                    let fatAmount = nutritionData[fatIndex].amount
                    cellA.fatTextView.text = """
                        \(fatAmount)
                        Fat
                        """
                }
            }
            cell = cellA
            
        } else if section == 1 {
            
            cellB.backgroundColor = .black
            cell = cellB
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var layoutSize = CGSize()
        
        if indexPath.section == 0 {
            layoutSize = CGSize(width: view.frame.width - 2 * padding, height: 250)
        } else if indexPath.section == 1 {
            layoutSize = CGSize(width: view.frame.width - 2 * padding, height: 50)
        }
        return layoutSize
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
//    }

}
