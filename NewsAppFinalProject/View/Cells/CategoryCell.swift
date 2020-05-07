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
    
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(categoryTitle: String) {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        categoryLabel.font = UIFont(name: "Avenir Heavy", size: 30)
        categoryLabel.text = categoryTitle
        
    }
    

}
