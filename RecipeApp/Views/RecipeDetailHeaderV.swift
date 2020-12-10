//
//  RecipeDetailHeaderV.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/18/20.
//

import UIKit

enum DishTypes {
    case breakfast, lunch, dinner, snack
    
    var title: String {
        switch self {
        case .breakfast: return "Breakfast"
        case .lunch: return "Lunch"
        case .dinner: return "Dinner"
        case .snack: return "Snack"
        }
    }
}

class RecipeDetailHeaderV: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let dishTypeLabel: InsetLabel = {
        let label = InsetLabel()
        label.font = UIFont(name: Theme.titleFontName, size: 17)
        label.textColor = Theme.accentColor
        label.textAlignment = .center
        label.contentInsets = UIEdgeInsets(top: 5, left: 2, bottom: 2, right: 2)
        return label
    }()

    let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: Theme.titleFontName, size: 25)
        label.textColor = UIColor.black
        return label
    }()
    
    let creditsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Theme.titleFontName, size: 17)
        label.textColor = Theme.backgroundColor
        return label
    }()
    
    let creditsTitleButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    let ingredientsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: Theme.titleFontName, size: 25)
        label.textColor = UIColor.black
        return label
    }()
    
    let instructionsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: Theme.titleFontName, size: 25)
        label.textColor = UIColor.black
        return label
    }()
    
    
    



    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code for layout

        addSubview(imageView)
        addSubview(dishTypeLabel)
        addSubview(recipeTitleLabel)
        addSubview(creditsTextLabel)
        addSubview(ingredientsTitleLabel)
        addSubview(instructionsTitleLabel)

        setupView()
    }

    private func setupView() {
        setupImageView()
        setupRecipeTitleLabel()
        setupCreditsTextLabel()
        setupIngredientsTitleLabel()
        setupDishTypeLabel()
        setupInstructionsTitleLabel()

    }

    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
    }
    
    private func setupDishTypeLabel() {
        dishTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        dishTypeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        dishTypeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dishTypeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func setupRecipeTitleLabel() {
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeTitleLabel.topAnchor.constraint(equalTo: dishTypeLabel.bottomAnchor, constant: 10).isActive = true
        recipeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        recipeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        recipeTitleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupCreditsTextLabel() {
        creditsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        creditsTextLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor, constant: 5).isActive = true
        creditsTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        creditsTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        creditsTextLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupIngredientsTitleLabel() {
        ingredientsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ingredientsTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        ingredientsTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    private func setupInstructionsTitleLabel() {
        instructionsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        instructionsTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        instructionsTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
