//
//  APIController.swift
//  day04
//
//  Created by Ganna DANYLOVA on 3/25/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit
import Foundation

class APIController {

    weak var delegate : APITwitterDelegate?
    let token : String
    
    init(token: String, delegate: APITwitterDelegate?) {
        self.delegate = delegate
        self.token = token
    }
    
    func requestTweets(requestTweet: String) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
