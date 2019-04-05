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
        getRequest()
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
    }
    
    
    func getRequest(){

        let urlPath: String = "https://api.intra.42.fr/v2/messages"
        let accessToken = "ccfcce4117499e9b2a705d389d4f8cbb7bc5913c1dc420a974dfa795006091ad"
        let url = URL(string: urlPath)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
        if let response = response {
            print("response")
            print(response)
        }
        guard let data = data else { return }
        print("data")
        print(data)
        do {
          let json = try JSONSerialization.jsonObject(with: data, options: [])
          print("json")
          print(json)
        } catch {
          print(error)
        }
    }
    session.resume()
}
}



//
//        struct Forum {
//            let name : String
//            let text : String
//            let date: String
//        }

//        extension Forum: CustomStringConvertible {
//            var description: String {
//                return "\(name), \(desc)"
//            }
//        }

//        var disForum = [Forum]()

//        var name : String?
//        var date : String?
//        var text : String?


//        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error
//            in
//            do {
//                if let jsonRes = try JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, Any> {
//                    print(jsonRes)
//                    let info = jsonRes["statuses"] as? [[String:AnyObject]]
//                    print(info as Any)
//                    for statuses in info!
//                    {
//                        text = (statuses["text"] as! String)
//                        name = statuses["user"]!["name"] as? String
////                        date = statuses["created_at"] as? String
//                    }
//                    disForum.append(Forum(name : name!, text : text!))
//            }
//        }
//            catch let error as NSError {
//                print(error)
//            }
//    }
//    task.resume()




//        let session = URLSession.shared
//        session.dataTask(with: url!) { (data, response, error) in
//            if let response = response {
//                print("response")
//                print(response)
//            }
//
//            guard let data = data else { return }
//            print("data")
//            print(data)
//
//            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print("json")
//                print(json)
//            } catch {
//                print(error)
//            }
//            }.resume()
