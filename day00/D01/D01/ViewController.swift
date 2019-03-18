//
//  ViewController.swift
//  D01
//
//  Created by Ganna DANYLOVA on 12/10/18.
//  Copyright © 2018 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var str1 = "Bonjour !"
    var str2: String = "Hello !"
    str2 = str1
    
    let pi = 3.14
    
    
    let tuple = (str1, pi)
    print(tuple)
    
    let anotherTuple: (String, String, Int) = ("One", "Un", 1)
    print()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

