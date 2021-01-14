//
//  RecipeDetailHeaderV.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/18/20.
//

import UIKit

class RecipeDetailHeaderV: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let ingredientsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: Theme.titleFontName, size: 25)
        label.textColor = UIColor.black
        return label
    }()
    
    var instructionsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: Theme.titleFontName, size: 25)
        label.textColor = UIColor.black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    private func setupView() {
        
        [imageView, ingredientsTitleLabel, instructionsTitleLabel].forEach { addSubview($0) }
        
        imageView.fillSuperview()
        ingredientsTitleLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil)
        ingredientsTitleLabel.centerInSuperview()
        instructionsTitleLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil)
        instructionsTitleLabel.centerInSuperview()

    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
