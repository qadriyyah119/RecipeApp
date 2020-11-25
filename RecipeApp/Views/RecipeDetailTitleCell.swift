//
//  RecipeDetailTitleCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/20/20.
//

import UIKit

class RecipeDetailTitleCell: UICollectionViewCell {
    
    let calorieTextView: UITextView = {
        let calorieTextView = UITextView()
        calorieTextView.addNutritionViewSettings()
        return calorieTextView
    }()
    
    let carbsTextView: UITextView = {
        let carbsTextView = UITextView()
        carbsTextView.addNutritionViewSettings()
        return carbsTextView
    }()
    
    let proteinTextView: UITextView = {
        let proteinTextView = UITextView()
        proteinTextView.addNutritionViewSettings()
        return proteinTextView
    }()
    
    let fatTextView: UITextView = {
        let fatTextView = UITextView()
        fatTextView.addNutritionViewSettings()
        return fatTextView
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        let sView = UIStackView(arrangedSubviews: [calorieTextView, carbsTextView, proteinTextView, fatTextView])
        sView.axis = .horizontal
        sView.alignment = .fill
        sView.distribution = .equalSpacing
        sView.spacing = 10
        
        addSubview(sView)
        sView.translatesAutoresizingMaskIntoConstraints = false
        sView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        setupView()
    }
    
    private func setupView() {
        setupCalorieView()
        setupCarbsView()
        setupProteinView()
        setupFatView()
    }
    
    private func setupStackView() {
        
    }
    
    private func setupCalorieView() {
        calorieTextView.translatesAutoresizingMaskIntoConstraints = false
        calorieTextView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        calorieTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        calorieTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func setupCarbsView() {
        carbsTextView.translatesAutoresizingMaskIntoConstraints = false
        carbsTextView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        carbsTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        carbsTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func setupProteinView() {
        proteinTextView.translatesAutoresizingMaskIntoConstraints = false
        proteinTextView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        proteinTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        proteinTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    private func setupFatView() {
        fatTextView.translatesAutoresizingMaskIntoConstraints = false
        fatTextView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        fatTextView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        fatTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

