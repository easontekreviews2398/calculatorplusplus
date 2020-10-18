//
//  ViewController.swift
//  CalcPlusPlus
//
//  Created by EasonTekReviews on 14/4/20.
//  Copyright © 2020 EasonTekReviews. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousOnScreen:Double = 0;
    var performingMath = false
    var operation = 0;
    var negative = false
    var ver = false
    func allclear() {
        label.text = ""
        previousOnScreen = 0;
        operation = 0;
        numberOnScreen = 0;
        negative = false
        ver = false
    }
    

    @IBOutlet weak var label: UILabel!
    
    @IBAction func button(_ sender: UIButton) {
        if performingMath == true {
            if sender.tag != 23 {
                label.text = String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
                performingMath = false
            } else if sender.tag == 23 {
                label.text = "3.141592653589"
            }
        } else if sender.tag == 17 {
            label.text = String(label.text! + ".")
        } else if sender.tag == 23 {
        } else if sender.tag == 19 {
            if negative == false{
                label.text = String("-" + label.text!)
                negative = true
            }
            
        } else {
            if ver == false {
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
            } else if ver == true {
                allclear()
                label.text = label.text! + String(sender.tag - 1)
                numberOnScreen = Double(label.text!)!
            }  else if sender.tag == 20 {
                label.text = String(numberOnScreen * numberOnScreen)
            }  else if sender.tag == 21 {
                label.text = String(numberOnScreen * numberOnScreen * numberOnScreen)
            }
        }
  
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            
            previousOnScreen = Double(label.text!)!
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16 {
            if operation == 12 {
                label.text = String(previousOnScreen / numberOnScreen)
            }
            else if operation == 13 {
                label.text = String(previousOnScreen * numberOnScreen)
            }
            else if operation == 14 {
                label.text = String(previousOnScreen - numberOnScreen)
            }
            else if operation == 15 {
                label.text = String(previousOnScreen + numberOnScreen)
            }
            else if operation == 22 {
                label.text = String(pow(Double(previousOnScreen),(Double(numberOnScreen))))
            }
            else if operation == 27 {
                label.text = String(pow(Double(previousOnScreen), Double( 1 / numberOnScreen)))
            }
        } else if sender.tag == 11 {
            allclear()
        }
        }
    }
