//
//  ViewController.swift
//  gdanylov2019
//
//  Created by AnnyDanny on 04/12/2019.
//  Copyright (c) 2019 AnnyDanny. All rights reserved.
//

import UIKit
import gdanylov2019s

class ViewController: UIViewController {

    var articleManager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Realization newArticle function")
        let article1 = articleManager.newArticle()
        article1.title = "Article one"
        article1.content = "Article one content"
        article1.creationDate = Date()
        article1.modificationDate = Date()
        article1.language = "fr"
        print(articleManager.save())
        
        let article2 = articleManager.newArticle()
        article2.title = "Article two"
        article2.content = "Article two context"
        article2.creationDate = Date()
        article2.modificationDate = Date()
        article2.language = "en"
        print(articleManager.save())
        
        print("\n\nRealization getAllArticles function -->>>")
        print(articleManager.getAllArticles())
    
        print("\n\nRealization getArticles withLang function -->>>")
        print(articleManager.getArticles(withLang: "fr"))
        
        print("\n\nRealization getArticles containString function -->>>")
        print(articleManager.getArticles(containString: "Article two"))
        
        print("\n\nRealization removeArticle function -->>>")
        print(articleManager.removeArticle(article: article1))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

