//
//  Request.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation


public struct Request {
    let builder: RequestBuilder
    let completion: (Result<Data, Error>) -> Void

    init(builder: RequestBuilder, completion: @escaping (Result<Data, Error>) -> Void) {
        self.builder = builder
        self.completion = completion
    }
    
    
    public static func basic(method: HTTPMethod = .get, baseURL: URL, path: String, params: [URLQueryItem]? = nil, completion: @escaping (Result<Data, Error>) -> Void) -> Request {
        let builder = BasicRequestBuilder(method: method, baseURL: baseURL, path: path, params: params)
        return Request(builder: builder, completion: completion)
    }
    
    
}

extension Request {
    static func popularMovies(completion: @escaping (Result<PagedResults<Movie>, Error>) -> Void) -> Request {
        Request.basic(baseURL: NewsDB.baseURL, category: "", params: [
            URLQueryItem(name: "sort_by", value: "popularity.desc")
        ]) { result in
          //we need to take the result and decode the response JSON into our expected type
            result.decoding(PagedResults<Movie>.self, completion: completion)
        }
    }
    
    static func topArticles(completion: @escaping (Result<PagedResults<Article>, Error>) -> Void) -> Request {
        
        
    }
    
    static func upcomingMovies(completion: @escaping (Result<PagedResults<Movie>, Error>) -> Void) ->
        Request {
            Request.basic(baseURL: MovieDB.baseURL, path: "movie/upcoming", params: [
                URLQueryItem(name: "sory_by", value: "popularity.desc")
            ]) {
                result in
                result.decoding(PagedResults<Movie>.self, completion: completion)
            }
    }
}
