//
//  Shape.swift
//  Day06
//
//  Created by Ganna DANYLOVA on 4/10/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class Shape: UIView {

    var circle : Bool = false
    
    func getRandomColor() -> UIColor {
        let red: CGFloat = CGFloat(drand48())
        let green: CGFloat = CGFloat(drand48())
        let blue: CGFloat = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    init(x: Int, y: Int) {
        super.init(frame: CGRect(x: x, y: y, width: 100, height: 100))
        self.backgroundColor = getRandomColor()
        if x % 2 == 0 {
            self.layer.cornerRadius = 50
            circle = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
