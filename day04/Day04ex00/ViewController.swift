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
    
    
    @IBOutlet weak var textField: UITextField!
    
    func tweet(tweet: [Tweet]) {
        print("one")
    }
    
    func error(error: NSError) {
        print("twi")
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let vika = Tweet(name : "vika", desc : "vika", date: "vika")
        data.append(vika)
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
//        make request from intra
//        learn tweeter documentation
        
//        let bearer = ((customkey + ":" + customsecret).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions())
//        let url = NSURL(string: "https://api.twitter.com/oauth2/token")
//        var request = URLRequest(url: url! as URL)
//        request.httpMethod = "POST"
//        request.setValue("Basic" + bearer, forHTTPHeaderField: "Autorization")
//        request.setValue("application/x-www-form-urlencoded;charset=utf-8", forHTTPHeaderField: "Content-Type")
//        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
//        let task = URLSession.shared.dataTask(with: request)
//
//        if let err = error {
//            print(error)
//        }
//        else if let d = data {
//            do {
//                if let dic : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    print(dic)
//                }
//            }
//        }
//        }
//    }

}

//let task = URLSession.shared.dataTask(with: request)

//"application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type"
//request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)




}








