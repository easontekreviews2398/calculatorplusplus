//
//  InterfaceController.swift
//  CalcPlusPlusWatch WatchKit Extension
//
//  Created by EasonTekReviews on 6/9/20.
//  Copyright © 2020 EasonTekReviews. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var calLabel: WKInterfaceLabel!
    var value = Int64(0)
    var calculatingBool = false
    var oper: String = ""
    var preValue = Int64(0)
    var isDecimal = false
    var decimalIsPresent = false

    
    
    @IBAction func c() {
        preValue = Int64(0)
        value = Int64(0)
        calLabel.setText("")
        calculatingBool = false
    }
    
    @IBAction func zero() {
        addToNumber(num: 0)
    }
    
    @IBAction func one() {
        addToNumber(num: 1)
    }
    
    @IBAction func two() {
        addToNumber(num: 2)
    }
    
    @IBAction func three() {
        addToNumber(num: 3)
    }
    
    @IBAction func four() {
        addToNumber(num: 4)
    }
    
    @IBAction func five() {
        addToNumber(num: 5)
    }
    
    @IBAction func six() {
        addToNumber(num: 6)
    }
    
    @IBAction func seven(){
        addToNumber(num: 7)
    }
    
    @IBAction func eight() {
        addToNumber(num: 8)
    }
    
    @IBAction func nine() {
        addToNumber(num: 9)
    }
    
    
    
    

    
    @IBAction func minus() {
        operatorPressed(op: "Minus")
        
    }
    
    @IBAction func plus() {
        operatorPressed(op: "Add")
        
    }
    
    @IBAction func times() {
        operatorPressed(op: "Multiply")
        
    }
    
    @IBAction func divide() {
        operatorPressed(op: "Divide")
        
    }
    

    @IBAction func decimalPoint() {
        decimalIsPresent = true
    }
    

    @IBAction func equals() {
        if (!calculatingBool) {
            var tempRes:Int64 = 0
            if oper == "Add" {
                tempRes = Int64((preValue + value))
                preValue = 0
                value = 0
            } else if oper == "Minus" {
                tempRes = Int64((preValue - value))
                preValue = 0
                value = 0
                
            } else if oper == "Multiply" {
                tempRes = Int64((preValue * value))
                preValue = 0
                value = 0
                
            } else if oper == "Divide" {
                tempRes = Int64((preValue / value))
                preValue = 0
                value = 0
            }
            calLabel.setText("\(tempRes)")
        } else {
            calLabel.setText("\(value)")
        }
    }
    func addDecimal() {
        let temp: String = String(value) + String(".")
        value = Int64(temp)!
        calLabel.setText(temp)
    }
    func addToNumber(num: Int64) {
        if !calculatingBool {
            if value == 0 {
                calLabel.setText("\(num)")
                value = Int64(num)
            }  else if isDecimal == false {
                let temp: String = String(value) + String(num)
                value = Int64(temp)!
                calLabel.setText(temp)
            }
        } else {
             if value == 0 {
                 calLabel.setText("\(num)")
                value = Int64(num)
             } else {
                 let temp: String = String(value) + String(num)
                 calLabel.setText(temp)
             }
        }
        
}


func operatorPressed(op: String) {
     preValue = value
     value = 0
    if (!calculatingBool) {
        if op == "Add" {
            oper = "Add"
            
        } else if op == "Minus" {
            oper = "Minus"
            
        } else if op == "Multiply" {
            oper = "Multiply"
            
        } else if op == "Divide" {
            oper = "Divide"
            
        }
        calculatingBool = false
    }
    
}
}
