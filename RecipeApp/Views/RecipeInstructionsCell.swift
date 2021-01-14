//
//  RecipeInstructionsCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 12/9/20.
//

import UIKit

class RecipeInstructionsCell: UICollectionViewCell {
    
    let instructionsStepLabel: InsetLabel = {
        let label = InsetLabel()
        label.contentInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
        label.font = UIFont(name: Theme.titleFontName, size: 20)
        label.textColor = UIColor.black
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let instructionsTextLabel: InsetLabel = {
        let label = InsetLabel()
//        label.contentInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
        label.font = UIFont(name: Theme.mainFontName, size: 18)
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byWordWrapping
//        label.textAlignment = .center
        return label
    }()
    
    var instructionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
//        layer.shadowOpacity = 1
//        layer.shadowOffset = CGSize.zero
//        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
//        layer.backgroundColor = UIColor.clear.cgColor
//
//        contentView.layer.masksToBounds = true
//        layer.cornerRadius = 10
        
        setupView()
    }
    
    private func setupView(){
        
        addSubview(instructionsTextLabel)
        
        instructionsTextLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
                
//        instructionsStackView.addArrangedSubview(instructionsStepLabel)
//        instructionsStackView.addArrangedSubview(instructionsTextLabel)
//        instructionsStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        addSubview(instructionsStackView)
//
//        NSLayoutConstraint.activate([
//            instructionsStackView.topAnchor.constraint(equalTo: topAnchor),
//            instructionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            instructionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
