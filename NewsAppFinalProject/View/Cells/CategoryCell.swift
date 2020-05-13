//
//  CategoryCell.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/6/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    static let identifier: String = "CategoryCell"
    
    @IBOutlet weak var backgroundImg: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(categoryTitle: String, image: UIImage) {
        backgroundImg.image = image
        backgroundColor = .white
        layer.cornerRadius = 5
        self.contentView.bringSubviewToFront(categoryLabel)
        categoryLabel.makeOutLine(oulineColor: .black, foregroundColor: .white)
        categoryLabel.lineBreakMode = .byWordWrapping
        categoryLabel.numberOfLines = 0
        categoryLabel.font = UIFont(name: "Avenir Heavy", size: 30)
        categoryLabel.text = categoryTitle
        
    }
    

}
