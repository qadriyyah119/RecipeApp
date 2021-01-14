//
//  SearchResultsCell.swift
//  RecipeApp
//
//  Created by Qadriyyah Thomas on 1/7/21.
//

import UIKit

class SearchResultsCell: UITableViewCell {
    @IBOutlet weak var resultsTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        resultsTitleLabel.font = UIFont(name: Theme.mainFontName, size: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
