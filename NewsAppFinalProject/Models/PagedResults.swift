//
//  PagedResults.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation



struct PagedResults<T: Model>: Model {
    let totalResults: Int
    let articles: [T]
}

extension PagedResults {
    static var decoder: JSONDecoder { T.decoder }
}
