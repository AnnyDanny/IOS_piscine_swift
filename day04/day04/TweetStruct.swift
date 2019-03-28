//
//  TweetStruct.swift
//  day04
//
//  Created by Ganna DANYLOVA on 3/25/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit
    
    struct Tweet {
        let name : String
        let desc : String
        let date: String
    }

    extension Tweet: CustomStringConvertible {
        var description: String {
            return "\(name), \(desc), \(date)"
        }
    }
    

