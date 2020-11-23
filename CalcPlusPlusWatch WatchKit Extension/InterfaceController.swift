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
    var value = Double(0)
    var calculatingBool = false
    var oper: String = ""
    var preValue = Double(0)
    var isDecimal = false

    
    
    @IBAction func c() {
        preValue = Double(0)
        value = Double(0)
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
        calLabel.setText("INCOMPLETE")
    }
    

    @IBAction func equals() {
        if (!calculatingBool) {
            var tempRes = Double(0)
            if oper == "Add" {
                tempRes = Double((preValue + value))
            } else if oper == "Minus" {
                tempRes = Double((preValue - value))
                
            } else if oper == "Multiply" {
                tempRes = Double((preValue * value))
                
            } else if oper == "Divide" {
                tempRes = Double((preValue / value))
                
            }
            calLabel.setText("\(tempRes)")
        } else {
            calLabel.setText("\(value)")
        }
    }
    
    func addToNumber(num: Double) {
        if !calculatingBool {
            if value == 0 {
                calLabel.setText("\(num)")
                value = Double(num)
            }  else if isDecimal == false {
                let temp: String = String(value) + String(num)
                value = Double(temp)!
                calLabel.setText(temp)
            }
        } else {
             if value == 0 {
                 calLabel.setText("\(num)")
                value = Double(num)
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
