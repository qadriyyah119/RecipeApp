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
    
    let dishTypeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        label.textColor = .red
        label.font = UIFont(name: "Avenir Medium", size: 16)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.cornerRadius = 5
        return label
    }()
    
    let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        label.textColor = .black
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.font = UIFont(name: "Avenir Medium", size: 25)
        return label
    }()
    

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code for layout
        
        backgroundColor = .red
        
        addSubview(imageView)
        addSubview(dishTypeLabel)
        addSubview(recipeTitleLabel)
        
        setupView()
    }
    
    private func setupView() {
        setupImageView()
        setupDishTypeLabel()
        setupRecipeTitleLabel()
        
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupRecipeTitleLabel() {
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeTitleLabel.topAnchor.constraint(equalTo: dishTypeLabel.bottomAnchor, constant: 10).isActive = true
        recipeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        recipeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        //recipeTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupDishTypeLabel() {
        dishTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        dishTypeLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 10).isActive = true
        dishTypeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
