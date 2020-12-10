//
//  RecipeInstructionsCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 12/9/20.
//

import UIKit

class RecipeInstructionsCell: UICollectionViewCell {
    
    let instructionsStepLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Theme.titleFontName, size: 20)
        label.textColor = UIColor.black
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let instructionsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Theme.mainFontName, size: 18)
        label.textColor = UIColor.black
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    var instructionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupView()
    }
    
    private func setupView(){
        
        instructionsStackView.addArrangedSubview(instructionsStepLabel)
        instructionsStackView.addArrangedSubview(instructionsTextLabel)
        instructionsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(instructionsStackView)
        
        NSLayoutConstraint.activate([
            instructionsStackView.topAnchor.constraint(equalTo: topAnchor),
            instructionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            instructionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
