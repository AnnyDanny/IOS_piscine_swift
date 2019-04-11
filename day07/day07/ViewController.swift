//
//  ViewController.swift
//  day07
//
//  Created by Ganna DANYLOVA on 4/11/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class ViewController: UIViewController {
    let client = DarkSkyClient(apiKey: "b9e76b953f7b7eab7e61975205d993d4")
    let bot = RecastAIClient(token : "94509fb783d9b8a314462303321e0187", language: "en")
    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func sendRequest(_ sender: UIButton) {
        
        guard let text = textField.text else { return }
        
        self.bot.textRequest(text, successHandler: { (response) in
            if let location = response.entities!["location"] as? [[String: Any]] {
                let lat = location[0]["lat"] as! NSNumber
                let lng = location[0]["lng"] as! NSNumber
                print("\nlocation----->>>", location)
                print("\nlat----->>>>", lat)
                print("\nlng----->>>>", lng)
                self.client.getForecast(latitude: Double(truncating: lat), longitude: Double(truncating: lng), completion: { (Forecast) in
                    switch Forecast {
                        case.success(let currentForecat, let requestData):
                            print("\ncurrentForecat---->>>>>", currentForecat)
                            print("\nrequestData------>>>>>>", requestData)
                            DispatchQueue.main.async {
                                if let ans = Forecast.value.0?.currently?.summary {
                                    print("\nFORECAST---->>>>", ans)
                                }
                                self.answer.text = Forecast.value.0?.currently?.summary
                            }
                        case.failure(let error):
                            print(error)
                        }
                    })
                }
            }, failureHandle: { (error) in
                self.answer.text = "ERROR"
                print("ERROR")
            })
        
//        bot.textRequest(text, successHandler: { (response) in
//            if let loc = response.entities!["location"] as? [[String: Any]] {
//                print("Response = \(loc)")
//
//            }
//            let lat = String(describing: response.entities!["location"])
//            print("nLat=\(lat)\nlat==\(lat[0][""])")
//
//        }, failureHandle: ({ (error) in
//            print("ERROR")
//        }))
    }
//    self.bot?.textRequest(self.textField.text!, successHandler: recastRequestDone, failureHandle: recastRequestFailed)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

