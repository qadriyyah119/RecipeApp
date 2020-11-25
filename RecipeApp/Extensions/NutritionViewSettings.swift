//
//  NutritionViewSettings.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/24/20.
//

import UIKit

extension UITextView {
    
    func addNutritionViewSettings() {
        textAlignment = .center
        font = UIFont(name: Theme.titleFontName, size: 18)
        textColor = UIColor.black
        backgroundColor = UIColor.white
        isSelectable = false
        isEditable = false
        layer.borderColor = Theme.accentColor?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 40
    }
}
