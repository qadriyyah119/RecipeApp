//
//  RecipePhotoCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Griffin on 11/2/20.
//

import UIKit

class RecipePhotoCell: UICollectionViewCell {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var recipeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.addRoundedCornersAndShadow()
        recipeTitleLabel.font = UIFont(name: Theme.mainFontName, size: 14)
        recipeTitleLabel.textColor = UIColor.black
    }
    
}
