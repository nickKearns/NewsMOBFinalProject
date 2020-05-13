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
    
    
    
    
    var numberOfItems: Int = 6
    
    var categories: [String] = [
        "business",
        "tech",
        "entertainment",
        "health",
        "science",
        "sports"
        
    ]
    
    var categoriesbackgrounds: [UIImage] = [
        UIImage(named: "business_background")!,
        UIImage(named: "tech_background")!,
        UIImage(named: "entertainment_background")!,
        UIImage(named: "health_background")!,
        UIImage(named: "science_background")!,
        UIImage(named: "sports_background")!
    ]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    
    var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.view.backgroundColor = .systemGray6
        
        
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Heavy", size: 20)!]
        title = "News Stand"
        
        setupCollectionView()
        
    }
    
    
    
    
    func setupCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = .systemGray6
        
        
        collectionView.register(UINib(nibName: "TitleCell", bundle: .main), forCellWithReuseIdentifier: TitleCell.identifier)
        collectionView.register(UINib(nibName: "CategoryCell", bundle: .main), forCellWithReuseIdentifier: CategoryCell.identifier)
        view.addSubview(collectionView)
        
        
        view.addSubview(collectionView)
        collectionView.reloadData()
        
        
    }
    
    
    
}


extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryVC = CategoryVC()
        categoryVC.thisPagesCategory = categories[indexPath.row]
        navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        
        
        //This creates the shadows and modifies the cards a little bit
        //Got this from a Riley Norris youtube video
        //https://github.com/rileydnorris/cardLayoutSwift
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        
        
        cell.set(categoryTitle: categories[indexPath.row], image: categoriesbackgrounds[indexPath.row])
        return cell
    }
    
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.40, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 25, bottom: 0, right: 25) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}


extension HomeVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let categoryVC = CategoryVC()
        categoryVC.thisPagesCategory = searchBar.text
        navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    
    
    
}
