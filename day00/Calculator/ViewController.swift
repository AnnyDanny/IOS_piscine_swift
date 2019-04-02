//
//  ViewController.swift
//  Calculator
//
//  Created by Ganna DANYLOVA on 12/6/18.
//  Copyright © 2018 Ganna DANYLOVA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    var stillTyping = false
    var dotIsPlaced = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    
    @IBOutlet weak var ACbutton: UIButton!
    
    @IBOutlet weak var NEGbutton: UIButton!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var multiplyButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var twoButton: UIButton!
    
    @IBOutlet weak var threeButton: UIButton!
    
    @IBOutlet weak var fourButton: UIButton!
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var sixButton: UIButton!
    
    @IBOutlet weak var sevenButton: UIButton!
    
    @IBOutlet weak var eightButton: UIButton!
    
    @IBOutlet weak var nineButton: UIButton!
    
    @IBAction func AcButtonPressed(_ sender: UIButton) {
        print("AC button pressed")
    }
    
    @IBAction func NegButtonPressed(_ sender: UIButton) {
        print("NEG button pressed")
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        print("Plus button pressed")
    }
    @IBAction func minusButtonPressed(_ sender: UIButton) {
        print("Minus button pressed")
    }
    
    @IBAction func multiplyButtonPressed(_ sender: UIButton) {
        print("Multiply button pressed")
    }
    @IBAction func divideButtonPressed(_ sender: UIButton) {
        print("Divide button pressed")
    }
    
    @IBAction func equalButtonPressed(_ sender: UIButton) {
        print("Equal button pressed")
    }
    
    @IBAction func zeroButtonPressed(_ sender: UIButton) {
        print("0 button pressed")
    }
    
    @IBAction func oneButtonPressed(_ sender: UIButton) {
        print("1 button pressed")
    }
    
    @IBAction func twoButtonPressed(_ sender: UIButton) {
        print("2 button pressed")
    }
    
    @IBAction func threeButtonPressed(_ sender: UIButton) {
        print("3 button pressed")
    }
    
    @IBAction func fourButtonPressed(_ sender: UIButton) {
        print("4 button pressed")
    }
    
    @IBAction func fiveButtonPressed(_ sender: UIButton) {
        print("5 button pressed")
    }
    
    @IBAction func sixButtonPressed(_ sender: UIButton) {
        print("6 button pressed")
    }
    
    @IBAction func sevenButtonPressed(_ sender: UIButton) {
        print("7 button pressed")
    }
    
    @IBAction func eightButtonPressed(_ sender: UIButton) {
        print("8 button pressed")
    }
    
    @IBAction func nineButtonPressed(_ sender: UIButton) {
        print("9 button pressed")
    }
    
    
    var currentInput: Double {
        get {
            return Double(displayResultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let valueArray = value.components(separatedBy: ".")
            if valueArray.count > 1 && valueArray[1] == "0" {
                displayResultLabel.text = "\(valueArray[0])"
            }
            else {
                displayResultLabel.text = "\(newValue)"
            }
            stillTyping = false
        }
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let number = sender.currentTitle!
        
        if stillTyping {
            if displayResultLabel.text?.count ?? 1 < 20 {
            displayResultLabel.text = displayResultLabel.text! + number
            }
        }
        else {
            displayResultLabel.text = number
            stillTyping = true
        }
        
    }
    
    @IBAction func twoOperandSignPressed(_ sender: UIButton) {
        operationSign = sender.currentTitle!
        firstOperand = currentInput
        stillTyping = false
        dotIsPlaced = false
    }
    
    func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        if secondOperand == 0 && operationSign == "÷" {
            currentInput = 0
        }
        else {
            currentInput = operation(firstOperand, secondOperand)
        }
        stillTyping = false
    }
    
    @IBAction func equlitySignPressed(_ sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        dotIsPlaced = false
        switch operationSign {
        case "+":
            operateWithTwoOperands{$0 + $1}
        case "-":
            operateWithTwoOperands{$0 - $1}
        case "✕":
            operateWithTwoOperands{$0 * $1}
        case "÷":
                operateWithTwoOperands{$0 / $1}
        default: break
    }
}
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        displayResultLabel.text = "0"
        stillTyping = false
        dotIsPlaced = false
        operationSign = ""
    }
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        if currentInput != 0 {
            currentInput = -currentInput
        }
    }
}

