//
//  NutritionalView.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 12/1/20.
//

import UIKit

enum NutritionValue {
    case calories, carbohydrates, protein, fat
    
    var title: String {
        switch self {
        case .calories: return "Calories"
        case .carbohydrates: return "Carbs"
        case .protein: return "Protein"
        case .fat: return "Fat"
        }
    }
}

class NutritionalView: UIView {
    
    lazy var nutritionValue: InsetLabel = {
        let label = InsetLabel()
        label.font = UIFont(name: Theme.titleFontName, size: 18)
        label.textColor = UIColor.black
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    lazy var nutritionTitle: InsetLabel = {
        let label = InsetLabel()
        label.font = UIFont(name: Theme.titleFontName, size: 18)
        label.textColor = UIColor.black
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    var nutritionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()

    
    private var value: Float
    private var valueTitle: NutritionValue
    
    init(value: Float, valueTitle: NutritionValue) {
        self.value = value
        self.valueTitle = valueTitle
        
        super .init(frame: .zero)
        
        setupView()
    }
    
    private func setupView(){
        self.backgroundColor = UIColor.white
        layer.borderColor = Theme.accentColor?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 40
        
        nutritionStackView.addArrangedSubview(nutritionValue)
        nutritionStackView.addArrangedSubview(nutritionTitle)
        nutritionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nutritionStackView)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 80),
            self.heightAnchor.constraint(equalToConstant: 80),
            nutritionStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            nutritionStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
