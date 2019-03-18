//
//  ViewController.swift
//  Day02Ex00
//
//  Created by Ganna DANYLOVA on 2/8/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

struct headline {
    var name : String
    var date : Date
    var description : String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBAction func item(_ sender: UIBarButtonItem) {
        
    }
    
    @IBOutlet weak var TableView: UITableView!
    
    var data : [headline] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let note1 = headline(name : "Robert", date : Date(), description : "laziness")
        print(note1)
        let note2 = headline(name: "Nick", date:  Date(), description: "boredom")
        print(note2)
        let note3 = headline(name: "Alex", date:  Date(), description: "anger")
        print(note3)
        
        data.append(note1)
        data.append(note2)
        data.append(note3)
        
        TableView.dataSource = self
        TableView.delegate = self
        TableView.estimatedRowHeight = 200
        TableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
//    in the following mathod we will return data items

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierCell") as! CustomTableViewCell
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = UIColor.yellow
        }
        else {
            cell.contentView.backgroundColor = UIColor.lightGray
        }
        
        cell.label1.text = data[indexPath.row].name
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        cell.label2.text = dateFormatter.string(from: data[indexPath.row].date)
        cell.label3.text = data[indexPath.row].description
        return cell
        
        
    }
    
    @IBAction func unWindSegue(segue : UIStoryboardSegue) {
        if segue.source is ClassAddControllerViewController {
            let vc = segue.source as! ClassAddControllerViewController
            let head = vc.head
            if head != nil {
                data.append(head!)
                print("name: \(head!.name), date: \(head!.date.description), desc: \(head!.description)")
                TableView.insertRows(at: [IndexPath(row: data.count - 1, section: 0)], with: .automatic)
            }
        }
    }
    
    @IBAction func unWindSegueOne(segue : UIStoryboardSegue) {

    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

}

