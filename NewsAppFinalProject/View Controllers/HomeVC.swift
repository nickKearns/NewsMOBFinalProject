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
    
    
    
//    var sections: [Section]  = [
//        TitleSection(title: "News Stand")
//    ]
    
    var numberOfItems: Int = 6
    
    var categories: [String] = [
        "business",
        "tech",
        "entertainment",
        "health",
        "science",
        "sports"
    
    ]
    
    
    
    
    var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        fetchTopStories()
        self.view.backgroundColor = .white
        setupCollectionView()
    }
//
//    lazy var collectionViewLayout: UICollectionViewLayout = {
//        var sections = self.sections
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
//            return sections[sectionIndex].layoutSection()
//        }
//        return layout
//    }()
    
    func setupCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        collectionView.register(UINib(nibName: "CategoryCell", bundle: .main), forCellWithReuseIdentifier: CategoryCell.identifier)
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        
        cell.set(categoryTitle: categories[indexPath.row])
        return cell
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.45, height: 180)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15) //.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
