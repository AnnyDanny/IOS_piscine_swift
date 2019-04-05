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
    
    init(delegate: APITwitterDelegate?, token: String) {
        self.delegate = delegate
        self.token = token
    }
    
    var disTweets = [Tweet]()
    
    func requestTweets(requestTweet: String) {

        var name : String?
        var date : String?
        var text : String?
        var dateT : DateFormatter?
        var newDate : String?
        
        let req = requestTweet.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let urlPath: String = "https://api.twitter.com/1.1/search/tweets.json?q=\(req)&lang=en&count=100&result_type=recent"
        let url = URL(string: urlPath)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, Any> {
                    print(jsonResult)
                    let tweetsInfo = jsonResult["statuses"] as? [[String:AnyObject]]
                    for statuses in tweetsInfo!
                    {
                        text = (statuses["text"] as! String)
                        name = statuses["user"]!["name"] as? String
                        date = statuses["created_at"] as? String
                        dateT = DateFormatter()
                        dateT?.dateFormat =  "E MMM dd HH:mm:ss Z yyyy"
                        
                        if let date = dateT?.date(from: date!) {
                            dateT?.dateFormat = "dd/MM/yyyy HH:mm"
                            newDate = dateT?.string(from: date)
                    }
                        self.disTweets.append(Tweet(name : name!, desc : text!, date : newDate!))
                    }
                    if self.delegate != nil  {
                        self.delegate?.proTweet(tweets: self.disTweets)
                        print(self.disTweets)
                    }
                }
            } catch let error as NSError {
                if self.delegate != nil {
                    self.delegate?.ifError(error: error)
                }
            }
        }
        task.resume()
    }
        
//        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
//            do {
//                if let jsonRes = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any> {
//                    let tweetInfo = jsonRes["statuses"] as! [[String:AnyObject]]
//                    for statuses in tweetInfo!
//                    {
//                    text = (statuses["text"] as! String)
//                    name = statuses["user"]!["name"] as? String
//                    date = statuses["created_at"] as! String
//                    }
//                    self.disTweets.append(Tweet(name : name!, text : text!, date : date!))
//            }
//                if self.delegate != nil {
//                    self.delegate?.proTweets(data: self.disTweets)
//                }
//            }
//        }
//        catch let error as NSError {
//            if self.delegate != nil {
//                self.delegate?.ifError(error: error)
//            }
//        }
//    }
//    task.resume()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}
