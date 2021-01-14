//
//  RecipeSearchResultsCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 1/13/21.
//

import UIKit

class RecipeSearchResultsCell: UICollectionViewCell {
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .darkGray
        return containerView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: Theme.recipeTitleFontName, size: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubView()        
    }
    
    private func setupSubView() {
       
        [containerView, recipeTitleLabel].forEach { addSubview($0) }
        
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
//        imageView.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor)
        recipeTitleLabel.anchor(top: nil, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
