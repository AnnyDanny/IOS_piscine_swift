//
//  SecondViewController.swift
//  day05_2
//
//  Created by Ganna DANYLOVA on 4/3/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self as? UITableViewDataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

