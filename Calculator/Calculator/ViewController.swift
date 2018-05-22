//
//  ViewController.swift
//  Swift-Caculator
//
//  Created by PengZK on 2018/5/7.
//  Copyright © 2018年 KUN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLbl: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        //输入的是0-9的数字或.
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = displayLbl.text!
            if digit == "." && textCurrentlyInDisplay.index(of: ".") != nil {
                return
            }
            displayLbl.text = textCurrentlyInDisplay + digit
        } else {
            //之前输入了操作符，开始下一次输入
            if digit == "." {
                displayLbl.text = "0."
            } else {
                displayLbl.text = digit
            }
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
    var displayValue: Double {
        get {
            return Double(displayLbl.text!)!
        }
        set {
            displayLbl.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()

    @IBAction func performOperation(_ sender: UIButton) {
        //输入的是操作符
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}

