//
//  APITwitterDelegate.swift
//  day04
//
//  Created by Ganna DANYLOVA on 3/25/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit
import Foundation

protocol APITwitterDelegate: NSObjectProtocol {
    func tweet(tweet: [Tweet])
    func error(error: NSError)
}
