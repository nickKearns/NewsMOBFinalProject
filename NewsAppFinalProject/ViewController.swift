//
//  ViewController.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchTopStories()
    }

    
    func fetchTopStories() {
        let api = NewsDB.api
        print("it got this far")
        api.send(request: .topArticles(completion: { result in
            switch result {
            case .success(let page):
//              print(page.results)
//              self.popularMovies = page.results
//              var basicSection = MovieSection()
//              basicSection.numberOfItems = page.results.count
//              basicSection.items = page.results
//              self.sections.append(TitleSection(title: "Popular Movies"))
//              self.sections.append(basicSection)
//              self.setupCollectionView()
                print(page.articles)
            case .failure(let error):  print(error)
            }
        }))
    }
    

}

