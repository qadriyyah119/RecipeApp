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
            calorieNutritionalView.nutritionTitle.text = NutritionValue.calories.title
            carbsNutritionalView.nutritionValue.text = "\(Int(carbsValue))"
            carbsNutritionalView.nutritionTitle.text = NutritionValue.carbohydrates.title
            proteinNutritionalView.nutritionValue.text = "\(Int(proteinValue))"
            proteinNutritionalView.nutritionTitle.text = NutritionValue.protein.title
            fatNutritionalView.nutritionValue.text = "\(Int(fatValue))"
            fatNutritionalView.nutritionTitle.text = NutritionValue.fat.title
        }
    }
    
    lazy var calorieNutritionalView: NutritionalView = {
        let view = NutritionalView(value: caloriesValue, valueTitle: .calories)
        return view
    }()
    
    var caloriesValue: Float {
        guard let calorieIndex = nutrition?.nutrients.firstIndex(where: {$0.title == NutritionValue.calories.title}) else { return 0 }
        return nutrition?.nutrients[calorieIndex].amount ?? 0
    }

    lazy var carbsNutritionalView: NutritionalView = {
        let view = NutritionalView(value: carbsValue, valueTitle: .carbohydrates)
        return view
    }()
    
    var carbsValue: Float {
        guard let carbsIndex = nutrition?.nutrients.firstIndex(where: { $0.title == NutritionValue.carbohydrates.title}) else { return 0 }
        return nutrition?.nutrients[carbsIndex].amount ?? 0
    }

    lazy var proteinNutritionalView: NutritionalView = {
        let view = NutritionalView(value: proteinValue, valueTitle: .protein)
        return view
    }()
    
    var proteinValue: Float {
        guard let proteinIndex = nutrition?.nutrients.firstIndex(where: { $0.title == NutritionValue.protein.title}) else { return 0 }
        return nutrition?.nutrients[proteinIndex].amount ?? 0
    }

    lazy var fatNutritionalView: NutritionalView = {
        let view = NutritionalView(value: fatValue, valueTitle: .fat)
        return view
    }()
    
    var fatValue: Float {
        guard let fatIndex = nutrition?.nutrients.firstIndex(where: { $0.title == NutritionValue.fat.title}) else { return 0 }
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

        nutritionLabelStackView.addArrangedSubview(calorieNutritionalView)
        nutritionLabelStackView.addArrangedSubview(carbsNutritionalView)
        nutritionLabelStackView.addArrangedSubview(proteinNutritionalView)
        nutritionLabelStackView.addArrangedSubview(fatNutritionalView)
        
        servingsLabelStackView.addArrangedSubview(servingsImg)
        servingsLabelStackView.addArrangedSubview(servingsLabel)
        timingLabelStackView.addArrangedSubview(timingImg)
        timingLabelStackView.addArrangedSubview(timingLabel)
        
        timingServingStackView.addArrangedSubview(servingsLabelStackView)
        timingServingStackView.addArrangedSubview(timingLabelStackView)
        
        nutritionLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        servingsLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        timingLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        timingServingStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nutritionLabelStackView)
        addSubview(timingServingStackView)
        
        NSLayoutConstraint.activate([
            servingsImg.widthAnchor.constraint(equalToConstant: 15),
            servingsImg.heightAnchor.constraint(equalToConstant: 15),
            timingImg.widthAnchor.constraint(equalToConstant: 15),
            timingImg.heightAnchor.constraint(equalToConstant: 15),
            nutritionLabelStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            nutritionLabelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            timingServingStackView.topAnchor.constraint(equalTo: topAnchor),
            timingServingStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

