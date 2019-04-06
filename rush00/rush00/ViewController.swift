//
//  ViewController.swift
//  rush00
//
//  Created by Ganna DANYLOVA on 4/4/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit
import SafariServices


class ViewController: UIViewController {

//    let grant_type = "client_credentials"
    let client_id = "3d120b3541ccf35990c63c640707e57ab4f618a0c66a01f983d2bb88b81cedd0"
    let client_secret = "8f85fcfb8aed813d0f6526f10868d202fe94db7cc272e484146cfa6f32ab2ac4"
    var code_s = "a0c700c986e5b935df19e8f6d3858314b1192d107d8b62b1bed8ec4f24366b9b"
    var token : String?
     var authSession: SFAuthenticationSession?

    @IBAction func button(_ sender: UIButton) {
        get_session()
    }
    
    func get_session(){
        
        authSession = SFAuthenticationSession(url: URL(string: "https://api.intra.42.fr/oauth/authorize?client_id=3d120b3541ccf35990c63c640707e57ab4f618a0c66a01f983d2bb88b81cedd0&redirect_uri=rush00%3A%2F%2Fforum&response_type=code")!, callbackURLScheme: "rush00://forum") {
            (callBack:URL?, error:Error? ) in
            guard error == nil, let successURL = callBack else {
                print(error!)
                print("asdasdasd")
                return
            }
            print(successURL.absoluteString)
            guard let url = URLComponents(string: successURL.absoluteString) else {
                return ;
            }
            print(url)
            self.token_access()
        }
        authSession?.start()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func token_access() {
//        let bearer = ("\(client_id):\(client_secret)").data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions())
        let url = URL(string: "https://api.intra.42.fr/oauth/token?client_id=\(client_id)&client_secret=\(client_secret)&code=\(code_s)")

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
//        request.setValue("\(client_id)", forHTTPHeaderField: "client_id")
//        request.setValue("\(client_secret)", forHTTPHeaderField: "client_secret")
//        request.setValue("\(code_s)", forHTTPHeaderField: "code_s")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)


        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if data != nil {
                do {
                    if let get : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        print(get)
                        self.token = get["access_token"] as? String
                        print(self.token as Any)
                        self.getRequest(token: self.token!)
                    }
                }
                catch (let error) {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    
    func getRequest(token : String){

        let urlPath: String = "https://api.intra.42.fr/v2/achievements/:id"
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

          let json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary]
          print("json")
          print(json)

        } catch {
          print(error)
        }
    }
    session.resume()
}
}

