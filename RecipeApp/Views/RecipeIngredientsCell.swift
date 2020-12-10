//
//  RecipeIngredientsCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 12/1/20.
//

import UIKit

class RecipeIngredientsCell: UICollectionViewCell {
    
    let ingredientsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Theme.mainFontName, size: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(ingredientsLabel)
        setupIngredientsLabel()
    }
    
    
    private func setupIngredientsLabel() {
        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ingredientsLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        ingredientsLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
