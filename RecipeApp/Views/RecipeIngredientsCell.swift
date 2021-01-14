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
        
        setupView()
    }
    
    private func setupView() {
        
        addSubview(ingredientsLabel)
        
        ingredientsLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
