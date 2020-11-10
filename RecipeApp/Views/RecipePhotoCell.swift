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
        recipeTitleLabel.textColor = UIColor.black 
    }
    
}
