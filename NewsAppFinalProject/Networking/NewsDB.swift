//
//  NewsDB.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation


struct NewsDB { // logic specific to the TMDB API
    

    
    
    
    
    public static let baseURL = URL(string: "https://newsapi.org/v2/top-headlines?")!
    public static var api: APIClient = {
        let configuration = URLSessionConfiguration.default
        let apiKey = "61d6351bc9ba4df2b8f76f92949bf6e6"
        configuration.httpAdditionalHeaders = [
            "Authorization": "Bearer \(apiKey)"
        ]
        return APIClient(configuration: configuration)
    }()
}
