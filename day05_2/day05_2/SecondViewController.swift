//
//  SecondViewController.swift
//  day05_2
//
//  Created by Ganna DANYLOVA on 4/3/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    
    struct Headline {
        var id : Int
        var title : String
    }
    
    var headline = [
        Headline(id: 1, title: "School_42"),
        Headline(id: 2, title: "New_York"),
        Headline(id: 3, title: "Japan"),
        Headline(id: 4, title: "Thailand"),
        Headline(id: 5, title: "Lostallo")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headline.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DisplayPlaces", for: indexPath)
        
        cell.textLabel?.text = headline[indexPath.row].title
        
        return cell
    }

}

