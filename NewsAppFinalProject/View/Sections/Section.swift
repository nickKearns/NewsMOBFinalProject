//
//  Section.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/6/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

protocol Section {
    var numberOfItems: Int { get }
    func layoutSection() -> NSCollectionLayoutSection?
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
}
