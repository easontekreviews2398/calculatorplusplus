//
//  ViewController.swift
//  CalcPlusPlus
//
//  Created by EasonTekReviews on 14/4/20.
//  Copyright © 2020 EasonTekReviews. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    var numberOnScreen:Float64 = 0;
    var previousOnScreen:Float64 = 0;
    var performingMath = false
    var operation = 0;
    var negative = false
    var ver = false
    var decimalIsPresent = false
    var resultOfCalculation: Float64 = 0
    func allclear() {
        label.text = ""
        previousOnScreen = 0;
        operation = 0;
        numberOnScreen = 0;
        decimalIsPresent = false;
        negative = false
        ver = false
        resultOfCalculation = 0
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func button(_ sender: UIButton) {
        if performingMath == true {
            if sender.tag != 23 {
                label.text = String(sender.tag - 1)
                numberOnScreen = Float64(label.text!)!
                performingMath = false
            } else if sender.tag == 23 {
                label.text = "3.141592653589"
            }
        } else if sender.tag == 17 {
            if decimalIsPresent == false {
                label.text = String(label.text! + ".")
                decimalIsPresent = true
            } else if decimalIsPresent == true {
                label.text = String(label.text!)
            }
        } else if sender.tag == 23 {
        } else if sender.tag == 19 {
            if negative == false{
                label.text = String("-" + label.text!)
                negative = true
            }
            
        } else {
            if ver == false {
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Float64(label.text!)!
            } else if ver == true {
                allclear()
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Float64(label.text!)!
            }
        }
  
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            if ver == false {
                previousOnScreen = Double(label.text!)!
                operation = sender.tag
                performingMath = true
                decimalIsPresent = false
                
            }
        }
        else if sender.tag == 16 {
            if ver == false {
                if operation == 12 {
                    resultOfCalculation = previousOnScreen / numberOnScreen
                    label.text = String(resultOfCalculation)
                    resultOfCalculation = previousOnScreen
                    resultOfCalculation = 0
                }
                else if operation == 13 {
                    resultOfCalculation = previousOnScreen * numberOnScreen
                    label.text = String(resultOfCalculation)
                    resultOfCalculation = previousOnScreen
                    resultOfCalculation = 0

                }
                else if operation == 14 {
                    resultOfCalculation = previousOnScreen - numberOnScreen
                    label.text = String(resultOfCalculation)
                    resultOfCalculation = previousOnScreen
                    resultOfCalculation = 0
                }
                else if operation == 15 {
                    resultOfCalculation = previousOnScreen + numberOnScreen
                    label.text = String(resultOfCalculation)
                    resultOfCalculation = previousOnScreen
                    resultOfCalculation = 0

                }
                else if operation == 22 {
                    label.text = String(pow(Double(previousOnScreen),(Double(numberOnScreen))))
                }
                else if operation == 27 {
                    label.text = String(pow(Double(previousOnScreen), Double( 1 / numberOnScreen)))
                } else if label.text == "43243551" {
                    label.text = String("Version 2.0.3")
                    ver = true
                } else if label.text == "533411731" {
                    label.text = String("Build 2212")
                    ver = true
                }
            }
        } else if sender.tag == 11 {
            allclear()
        }
        }
    }
