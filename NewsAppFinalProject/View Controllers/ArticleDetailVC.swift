//
//  ArticleDetailVC.swift
//  NewsAppFinalProject
//
//  Created by Nicholas Kearns on 5/10/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit
import WebKit


class ArticleDetailVC: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    var articleString: String = ""
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let articleURL = URL(string: articleString)
        let myRequest = URLRequest(url: articleURL!)
        webView.load(myRequest)
        
        
    }
    
    
    
    
    
    
}
