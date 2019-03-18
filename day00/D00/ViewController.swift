//
//  ViewController.swift
//  D00
//
//  Created by Ganna DANYLOVA on 12/4/18.
//  Copyright © 2018 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func ButtonOne(_ sender: UIButton) {
    }
    @IBAction func ButtonTwo(_ sender: UIButton) {
    }
    
    @IBAction func ButtonThree(_ sender: UIButton) {
    }
    @IBOutlet weak var helloLabel: UILabel!
    @IBAction func clickButton(_ sender: UIButton) {
        helloLabel.text = "Hello World!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
