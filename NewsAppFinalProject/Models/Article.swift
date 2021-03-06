//
//  Article.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation






// MARK: - Article
struct Article: Model, Hashable {
    let source: Source
    let author: String?
    let title, description: String?
    let url: String
    let urlToImage: String?
    let content: String?
    
}

struct Source: Model, Hashable {
    let id: String?
    let name: String
    
}







