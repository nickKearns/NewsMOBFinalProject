//
//  CategoryVC.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/9/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class CategoryVC: UIViewController {
    
    
    
    var thisPagesCategory: String!
    
    var articles: [Article] = []
    
    
    var page: Int = 1
    
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupTableView()
        makeNetworkCallForArticles()
        
    }
    
    
    func makeNetworkCallForArticles() {
        
        let api = NewsDB.api
        print("it got this far")
        api.send(request: .givenCategoryArticles(page: self.page, category: thisPagesCategory, completion: { result in
            switch result {
            case .success(let page):
                self.articles.append(contentsOf: page.articles)
                print(page.articles)
                self.tableView.reloadData()
            case .failure(let error):  print(error)
            }
        }))
        
    }
    
    
    
    
    
    
    
    func setupTableView() {
        tableView.backgroundColor = .black
        
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.frame = view.bounds
        
        tableView.register(UINib(nibName: "ArticleCell", bundle: .main), forCellReuseIdentifier: ArticleCell.identifier)
        
        
        tableView.reloadData()
        
        
        
    }
    
    
    
    
}


extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(articles.count)
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
        cell.set(article: articles[indexPath.row])
        print(articles[indexPath.row].title)
        //        print(cell.articleTitleLabel.text!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = articles.count - 1
        if indexPath.row == lastElement {
            self.page += 1
            makeNetworkCallForArticles()
        }
    }
    
}
