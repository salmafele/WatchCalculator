//
//  TipInterfaceController.swift
//  WatchCalculator WatchKit Extension
//
//  Created by Salma on 12/26/19.
//  Copyright © 2019 Salma. All rights reserved.
//
import WatchKit
import Foundation

class TipInterfaceController: WKInterfaceController {

    var value = 0
    var calculateBool: Bool = false
    var lastValue = 0
    var oper: String = ""

     @IBOutlet weak var billAmount: WKInterfaceLabel!
    
    @IBAction func ac() {
        
        lastValue = 0
        value = 0
        billAmount.setText("\(value)")
        calculateBool = false
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    override func willActivate() {
        super.willActivate()
    }
    override func didDeactivate() {
        super.didDeactivate()
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
    @IBAction func seven() {
        addToNumber(num: 7)
    }
    @IBAction func eight() {
        addToNumber(num: 8)
    }
    @IBAction func nine() {
        addToNumber(num: 9)
    }
    @IBAction func zero() {
        addToNumber(num: 0)
    }

    @IBAction func ten() {
        operatorPressed(op: "10%")
        billAmount.setText("\(0.01 * 100)")
    }
    @IBAction func fifteen() {
        operatorPressed(op: "15%")
        billAmount.setText("\(0.015 * 100)")
    }
    @IBAction func twinty() {
        operatorPressed(op: "20%")
        billAmount.setText("\(0.020 * 100)")
    }

    // tip percentage
    @IBAction func calculate() {
        if (calculateBool) {
            
            var tempRes = ""
            
            if (oper == "10%") {
                tempRes = "$ " + "\(lastValue + value)" + "\(ten())"

            } else if (oper == "15%") {
                tempRes = "$ " + "\(lastValue + value)" + "\(fifteen())"

            } else if (oper == "20%") {
                tempRes = "$ " + "\(lastValue + value)" + "\(twinty())"

            } else { // error
            }
            
            billAmount.setText("\(tempRes)")
            calculateBool = false
            
        } else {
            billAmount.setText("\(value)")
        }
    }
    
    // add numbers when typed
    func addToNumber(num: Int) {
        if (calculateBool) {
                
            if (value == 0) {
                billAmount.setText("\(num)")
                value = num
                
            } else {
                let temp: String = String(value) + String(num)
                value = Int(temp)!
                billAmount.setText(temp)
                }
            
        } else {
            if (value == 0) {
                billAmount.setText("\(num)")
                value = num
                
            } else {
                let temp: String = String(value) + String(num)
                value = Int(temp)!
                billAmount.setText(temp)
                }
        }
    }
    
    func operatorPressed(op: String) {
        if (!calculateBool) {
            lastValue = value
            value = 0
            
            if (op == "ten") {
                oper = "ten"
                billAmount.setText("10%")
                
            } else if (op == "fifteen") {
                oper = "fifteen"
                billAmount.setText("15%")

            } else if (op == "twinty") {
                oper = "twinty"
                billAmount.setText("20%")

            } else { // error
            }
            
            calculateBool = true
        }
    }
}
