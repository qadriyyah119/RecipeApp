//
//  RecipeDetailTitleCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/20/20.
//

import UIKit

class RecipeDetailTitleCell: UICollectionViewCell {
    
    var nutrition: Nutrition?{
        didSet{
            calorieNutritionalView.nutritionValue.text = "\(Int(caloriesValue))"
            carbsNutritionalView.nutritionValue.text = "\(Int(carbsValue))"
            proteinNutritionalView.nutritionValue.text = "\(Int(proteinValue))"
            fatNutritionalView.nutritionValue.text = "\(Int(fatValue))"
        }
    }
    
    lazy var calorieNutritionalView: NutritionalView = {
        let view = NutritionalView(value: caloriesValue, valueTitle: .calories)
        return view
    }()
    
    var caloriesValue: Float {
        guard let calorieIndex = nutrition?.nutrients.firstIndex(where: {$0.title == NutritionValue.calories.jsonKey}) else { return 0 }
        return nutrition?.nutrients[calorieIndex].amount ?? 0
    }

    lazy var carbsNutritionalView: NutritionalView = {
        let view = NutritionalView(value: carbsValue, valueTitle: .carbohydrates)
        return view
    }()
    
    var carbsValue: Float {
        guard let carbsIndex = nutrition?.nutrients.firstIndex(where: { $0.title == NutritionValue.carbohydrates.jsonKey}) else { return 0 }
        return nutrition?.nutrients[carbsIndex].amount ?? 0
    }

    lazy var proteinNutritionalView: NutritionalView = {
        let view = NutritionalView(value: proteinValue, valueTitle: .protein)
        return view
    }()
    
    var proteinValue: Float {
        guard let proteinIndex = nutrition?.nutrients.firstIndex(where: { $0.title == NutritionValue.protein.jsonKey}) else { return 0 }
        return nutrition?.nutrients[proteinIndex].amount ?? 0
    }

    lazy var fatNutritionalView: NutritionalView = {
        let view = NutritionalView(value: fatValue, valueTitle: .fat)
        return view
    }()
    
    var fatValue: Float {
        guard let fatIndex = nutrition?.nutrients.firstIndex(where: { $0.title == NutritionValue.fat.jsonKey}) else { return 0 }
        return nutrition?.nutrients[fatIndex].amount ?? 0
    }
    
    private var nutritionLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        return stackView
    }()
    
    let recipeTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: Theme.recipeTitleFontName, size: 25)
        label.textColor = UIColor.black
        return label
    }()
    
    let creditsTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = UIFont(name: Theme.titleFontName, size: 16)
        label.textColor = Theme.backgroundColor
        return label
    }()
    
    let creditsTitleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont(name: Theme.titleFontName, size: 16)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.minimumScaleFactor = 0.5
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }()
    
    
    let servingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Theme.titleFontName, size: 15)
        label.textColor = UIColor.black
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        return label
    }()
    
    let servingsImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var servingsLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    let timingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Theme.titleFontName, size: 15)
        label.textColor = UIColor.black
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        return label
    }()
    
    let timingImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var timingLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    private var timingServingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)

        setupView()
    }
    
    private func setupView() {

        [calorieNutritionalView, carbsNutritionalView, proteinNutritionalView, fatNutritionalView].forEach { nutritionLabelStackView.addArrangedSubview($0)}
        [servingsImg, servingsLabel].forEach { servingsLabelStackView.addArrangedSubview($0) }
        [timingImg, timingLabel].forEach { timingLabelStackView.addArrangedSubview($0) }
        [servingsLabelStackView, timingLabelStackView].forEach { timingServingStackView.addArrangedSubview($0) }
        [recipeTitleLabel, creditsTitleButton, nutritionLabelStackView, timingServingStackView].forEach { addSubview($0) }
        
        servingsImg.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 15, height: 15))
        timingImg.anchor(top: nil, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 15, height: 15))
        
        recipeTitleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
//        creditsTextLabel.anchor(top: recipeTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        creditsTitleButton.anchor(top: recipeTitleLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
        timingServingStackView.anchor(top: creditsTitleButton.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 14, left: 0, bottom: 0, right: 0))
        nutritionLabelStackView.anchor(top: timingServingStackView.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 18, left: 0, bottom: 0, right: 0))
        nutritionLabelStackView.centerInSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

