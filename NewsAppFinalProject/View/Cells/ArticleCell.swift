//
//  ArticleCell.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/9/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    
    static let identifier: String = "ArticleCell"

    @IBOutlet weak var articleTitleLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    
    @IBOutlet weak var sourceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func set(article: Article) {
        articleTitleLabel.text = article.title
        articleTitleLabel.font = UIFont(name: "Avenir Heavy" , size: 18)
        sourceLabel.text = article.author ?? ""
        sourceLabel.font = UIFont(name: "Avenir Heavy", size: 15)
        guard let urlToImageString = article.urlToImage else { return }
        let imageURL = URL(string: urlToImageString)
        articleImageView.kf.setImage(with: imageURL)
    }
    
    override func prepareForReuse() {
        articleImageView.kf.cancelDownloadTask()
        articleImageView.image = nil
        articleTitleLabel.text = nil
    }
    
}
