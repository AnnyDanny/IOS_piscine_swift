//
//  messageView.swift
//  rush00
//
//  Created by Ganna DANYLOVA on 4/7/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import Foundation
import UIKit

struct cellMsg {
    var name: String
    var date: String
    var msg : String
    
}


class messageView: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var token: String = ""
    var msgUrl: String = ""
    var msgs: [cellMsg] = []


    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        get_message(msgIdUrl: self.msgUrl)
        
        TableView.delegate = self
        TableView.dataSource = self
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

                print(">>> MSG JSON first")
                DispatchQueue.main.async {
                    for value in json {
                        let author: NSDictionary = (value["author"] as? NSDictionary)!
//                        print("login:", author["login"] ?? "NC")
//                        print("date:", value["created_at"] ?? "NC")
//                        print("msg:", value["content"] ?? "NC")
//                        //                        print(">>> Testing msg: ", message,"\nMarkdown: ", content["markdown"] ?? "NC")
                        self.msgs.append(cellMsg(name: (author["login"] as? String)! , date: (value["created_at"] as? String)!, msg: (value["content"] as? String)!))
                    }
                    print(">>>MSGS ARRAY: ", self.msgs)
                    print("first name: ", self.msgs[0].name, "first msg: ", self.msgs[0].msg)
                    self.TableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
        session.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return msgs.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "msgCell", for: indexPath) as? MessageTableViewCell {
//            DispatchQueue.main.async {
//                cell.name.text = self.msgs[indexPath.row].name
//                cell.msg.text = self.msgs[indexPath.row].msg
//                cell.date.text = self.msgs[indexPath.row].date
//
//            }
//            return cell
//        }
//        return UITableViewCell()
//    }
//        cell?.name?.text = self.msgs[indexPath.row].name
//        cell?.date?.text = self.msgs[indexPath.row].date
//        return cell!
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print(">>> CELL START!!!")
////        let cell : MessageTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "msgCell", for: indexPath) as? MessageTableViewCell)!
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "msgCell") as! MessageTableViewCell
//
//            print("  !!!HERE!!!")
////            DispatchQueue.main.async {
//            cell.name.text = self.msgs[indexPath.row].name
//            cell.msg.text = self.msgs[indexPath.row].msg
//            cell.date.text = self.msgs[indexPath.row].date
//            print("PRE RETURN CELL:", cell)
//            return cell
////        }
////        return UITableViewCell()
//    }
//    }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            print(">>> CELL START!!!")
            let cell = tableView.dequeueReusableCell(withIdentifier: "msgCell") as! MessageTableViewCell
            print("  !!!HERE!!!")
            cell.name.text = self.msgs[indexPath.row].name
            cell.msg.text = self.msgs[indexPath.row].msg
            cell.date.text = self.msgs[indexPath.row].date
            print("PRE RETURN CELL:", cell)
            return cell
        }
}




