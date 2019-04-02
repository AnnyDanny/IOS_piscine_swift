//
//  ClickViewController.swift
//  Calculator
//
//  Created by Ganna DANYLOVA on 4/1/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ClickViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!

    
    @IBAction func ClickMeButton(_ sender: UIButton) {
        print("Hello World !")
        Label.text = "Hello World !"
    }
    
}
