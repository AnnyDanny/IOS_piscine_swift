//
//  ViewController.swift
//  day04
//
//  Created by Ganna DANYLOVA on 3/20/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APITwitterDelegate {
    
    var data = [Tweet]()
    let customkey = "80TVxnOOYfb7RRmEkYtCem0BY"
    let customsecret = "ysUvOHDliJW62D3xMDxCQP4qti6uYkMemZZ4prT2uC2jDl6sSP"
    var api : APIController?
    var token : String?
    var search : String = "school 42"
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        textField.text = "scholl 42"
        textField.delegate = self as? UITextFieldDelegate
        textField.returnKeyType = .done
//        let vika = Tweet(name : "vika", desc : "vika", date: "vika")
//        data.append(vika)
        autorizationRequest()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierCell") as! TableViewCell
        cell.date.text = data[indexPath.row].date
        cell.desc.text = data[indexPath.row].desc
        cell.name.text = data[indexPath.row].name
        return cell
}
    
 func autorizationRequest() {
        let bearer = ((customkey + ":" + customsecret).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions())
        let url = URL(string: "https://api.twitter.com/oauth2/token")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("Basic " + bearer, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if data != nil {
                do {
                    if let get : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        print(get)
                        self.token = get["access_token"] as? String
                        self.api = APIController(delegate: self, token: self.token!)
                        self.api?.requestTweets(requestTweet: self.search)
                        
                        print(self.token as Any)
                    }
                }
                catch (let error) {
                    print(error)
                }
            }
        }
        task.resume()
        
}
    
    func proTweet(tweets: [Tweet]) {
        self.data = tweets
        for twe in tweets {
            print(twe)
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func ifError(error: NSError)
    {
        print("Error: \(error)")
    }
    
    
    func fieldReturn(_ text: UITextField) -> Bool
    {
        text.resignFirstResponder()
        return false
    }
    
    func fieldEdit(_ text: UITextField) {
        textField.text = text.text
        search = (textField?.text)!
    }
    
    
    @IBAction func get_wteets(_ sender: UITextField) {
        let newApi = APIController(delegate: self, token: self.token!)
        newApi.requestTweets(requestTweet: self.search)
    }
    
}




