//
//  TopicsViewController.swift
//  rush00
//
//  Created by Ganna DANYLOVA on 4/6/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

struct topic{
    var name: String
    var data:String
}

extension TopicsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell")
//        cell?.textLabel?.text = self.topics[indexPath.row].name
        return cell!
    }
    
    
}


class TopicsViewController: UIViewController {
    @IBOutlet weak var topicTable: UITableView!
    
    var token: String = ""
    var topics: [topic] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        topicTable.delegate = self
        topicTable.dataSource = self
        self.getRequest(token: self.token)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRequest(token : String){
        
        let urlPath: String = "https://api.intra.42.fr/v2/topics"
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
            print("data")
            print(data)
            do {
                
                //            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary]
                //            for item in dataArray { // loop through data items
                //                let obj = item as NSDictionary
                //                for (key, value) in obj {
                //                    print("Property: \"\(key as String)\"")
                //                }
                //            }
                
                let json :  [NSDictionary] = (try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary])!
                print("json")
                //            print(json)
                print(json.first)
                //            if let dic : [NSDictionary] = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [NSDictionary] {
                
                                DispatchQueue.main.async {
                for value in json {
                    let author: NSDictionary = (value["author"] as? NSDictionary)!
                    print("\nAuthor:", author)
                    print("date: ", value["created_at"] ?? "NC")
                    print("login:", author["login"] ?? "NC")
                    self.topics.append(topic(name: (author["login"] as? String)! , data: (value["created_at"] as? String)! ))
                }
                self.topicTable.reloadData()
                }
            } catch {
                print(error)
            }
        }
        session.resume()
    }

}
