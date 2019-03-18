//
//  ClassAddControllerViewController.swift
//  Day02Ex00
//
//  Created by Ganna DANYLOVA on 2/8/19.
//  Copyright © 2019 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ClassAddControllerViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var head: headline?
    
    @IBOutlet weak var FieldName: UITextField!
    
    @IBOutlet weak var Description: UITextView! 
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var Data: UIDatePicker!
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController!.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        FieldName.placeholder = "Name"
        Description.layer.borderWidth = 4
        FieldName.delegate = self
        Description.delegate = self
        Data.minimumDate = Date()
        
//        Description.layer.borderColor = UIColor.black()
        // Do any additional setup after loading the view.
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
//        if let name = textField.text, name.isEmpty {
//            //alert
//            //UIAlertController
//        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if sender as AnyObject? === doneButton {
            if let name = FieldName.text, !name.isEmpty {
                let date = Data.date
                head = headline(name: name, date: date, description: Description.text)
            }
        }
//        if
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
