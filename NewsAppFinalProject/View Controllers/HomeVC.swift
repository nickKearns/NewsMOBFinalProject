//
//  HomeVC.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/4/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit
import WebKit

class HomeVC: UIViewController {
    
    
    
    var sections: [Section]  = [
        TitleSection(title: "News Stand")
        
    ]
    
    
    
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        fetchTopStories()
        self.view.backgroundColor = .white
        setupCollectionView()
    }
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()
    
    func setupCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: collectionViewLayout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)

        view.addSubview(collectionView)
        
        
        view.addSubview(collectionView)
        collectionView.reloadData()

        
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


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    
}

