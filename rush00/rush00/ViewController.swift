//
//  ViewController.swift
//  rush00
//
//  Created by Ganna DANYLOVA on 4/4/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    let grant_type = "client_credentials"
    let client_id = "3d120b3541ccf35990c63c640707e57ab4f618a0c66a01f983d2bb88b81cedd0"
    let client_secret = "8f85fcfb8aed813d0f6526f10868d202fe94db7cc272e484146cfa6f32ab2ac4"
//    let code = "Authorization"
//    var api : APIController?
    var token : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        token_access()
    }

    func token_access() {
        let bearer = ((client_id + ":" + client_secret).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions())
        let url = URL(string: "https://api.intra.42.fr/oauth/token")
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
                        print(self.token as Any)
                    }
                }
                catch (let error) {
                    print(error)
                }
            }
        }
        task.resume()
        
        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let response = response {
//                print(response)
//            }
//        }
//        task.resume()
//    }
    }
}

