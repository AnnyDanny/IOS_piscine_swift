//
//  messageView.swift
//  rush00
//
//  Created by Ganna DANYLOVA on 4/7/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import Foundation
import UIKit



class messageView: UIViewController {
    
    var token: String = ""
    let msrURL: String = ""
    var topics: [topic] = []
    
    override func viewDidLoad() {
        get_message(msgIdUrl: self.msrURL)
    }
    
    func get_message(msgIdUrl : String){
        
        let urlPath: String = msgIdUrl
        let url = URL(string: urlPath)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            if let response = response {
                print("response")
                print(response)
            }
            guard let data = data else { return }
            print(">>> MSG data <<<")
            print(data)
            do {

                let json :  [NSDictionary] = (try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary])!
                
                print(">>> MSG JSON first", json.first)
//                DispatchQueue.main.async {
//                    for value in json {
//                        let author: NSDictionary = (value["author"] as? NSDictionary)!
//                        let message: NSDictionary = (value["message"] as? NSDictionary)!
//                        let content : NSDictionary = (message["content"] as! NSDictionary)
//                        //                        print("\nAuthor:", author)
//                        //                        print("date: ", value["created_at"] ?? "NC")
//                        //                        print("login:", author["login"] ?? "NC")
//                        //                        print(">>> Testing msg: ", message,"\nMarkdown: ", content["markdown"] ?? "NC")
//                        self.topics.append(topic(name: (author["login"] as? String)! , data: (value["created_at"] as? String)!, msgUrl: (value["messages_url"] as? String)!))
//                    }
//                    self.topicTable.reloadData()
//                }
            } catch {
                print(error)
            }
        }
        session.resume()
    }
}
