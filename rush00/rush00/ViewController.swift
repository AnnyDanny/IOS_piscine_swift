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
    var code_s = "1c3bdd5a2f608fa60cddc88eb5450c2128eb85f82b6f02247305f5247ca2eb7d"
    var token : String?
     var authSession: SFAuthenticationSession?

    @IBAction func button(_ sender: UIButton) {
        print("lol")
        get_session()
        print("lol2")
    }
    
    func get_session(){
        let urlParams = "client_id=3d120b3541ccf35990c63c640707e57ab4f618a0c66a01f983d2bb88b81cedd0&redirect_uri=rush00%3A%2F%2Fforum&response_type=code"
        authSession = SFAuthenticationSession(url: URL(string: "https://api.intra.42.fr/oauth/authorize?\(urlParams)")!, callbackURLScheme: "rush00://forum", completionHandler: { (callBack:URL?, error:Error? ) in
            guard error == nil, let successURL = callBack else {
                print(error!)
                return
            }
            print("successURL")
            print(successURL)
            var successURL1 = successURL.absoluteString.components(separatedBy: "?")

            print(successURL1)
            print("lol3")
            self.token_access(code: successURL1[1])
            print("lol4")
        })
        authSession?.start()
        print("lol")
        
    }
    
    @IBAction func log(_ sender: UIButton) {
        print("hhhhhhhhhh")
        get_session()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func go(){
        performSegue(withIdentifier: "toTopics", sender: self)
    }
    
    func token_access(code: String?) {
        let url = URL(string: "https://api.intra.42.fr/oauth/token?client_id=\(client_id)&client_secret=\(client_secret)&\(code ?? "")")

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)

        DispatchQueue.global().async{
            let task = URLSession.shared.dataTask(with: request) {data, response, error in
                if data != nil {
                    do {
                        if let get : NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            print(get)
                            self.token = get["access_token"] as? String
                            self.go()
                        }
                    }
                    catch (let error) {
                        print(error)
                    }
                }
                
            }
            task.resume()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? TopicsViewController)?.token = self.token!
    }

}

