//
//  UIViewExtensions.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 11/9/20.
//

import UIKit

extension UIView {
    
    func addRoundedCornersAndShadow() {
        layer.cornerRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
    }
}
