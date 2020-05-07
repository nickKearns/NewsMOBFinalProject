////
////  CategoriesSection.swift
////  NewsAppFinalProject
////
////  Created by Nicholas Kearns on 5/6/20.
////  Copyright © 2020 Nicholas Kearns. All rights reserved.
////
//
//import UIKit
//
//
//struct CategoriesSection: Section {
//
//    
//    
//    
//    var numberOfItems: Int = 6
//    
//    var categories: [String] = [
//        "business",
//        "tech",
//        "entertainment",
//        "health",
//        "science",
//        "sports"
//    
//    ]
//
//
//    
////    func layoutSection() -> NSCollectionLayoutSection? {
////        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.25))
////        let item = NSCollectionLayoutItem(layoutSize: itemSize)
////        
////        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
////        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
////        
////        let section = NSCollectionLayoutSection(group: group)
////        
////        return section
////        
////    }
////    
//    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
//        cell.set(categoryTitle: categories[indexPath.row])
//        return cell
//    }
//    
//    
//    
//    
//    
//}
