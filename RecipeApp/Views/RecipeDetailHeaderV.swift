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

    let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
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



    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code for layout

        addSubview(imageView)
        addSubview(recipeTitleLabel)
        addSubview(creditsTextLabel)

        setupView()
    }

    private func setupView() {
        setupImageView()
        setupRecipeTitleLabel()
        setupCreditsTextLabel()

    }

    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
    }

    private func setupRecipeTitleLabel() {
        recipeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        recipeTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        recipeTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        recipeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        recipeTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupCreditsTextLabel() {
        creditsTextLabel.translatesAutoresizingMaskIntoConstraints = false
        creditsTextLabel.topAnchor.constraint(equalTo: recipeTitleLabel.bottomAnchor, constant: 5).isActive = true
        creditsTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        creditsTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        creditsTextLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
