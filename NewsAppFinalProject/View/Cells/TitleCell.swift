//
//  TitleCell.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/6/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit


class TitleCell: UICollectionViewCell {
    
    
    static var identifier: String = "TitleCell"

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(title: String) {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        titleLabel.text = title
        titleLabel.font = UIFont(name: "Avenir Heavy", size: 30)
    }
    
    
}
