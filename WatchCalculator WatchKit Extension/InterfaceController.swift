//
//  InterfaceController.swift
//  WatchCalculator WatchKit Extension
//
//  Created by Salma on 12/26/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var value = 0
    var calculateBool: Bool = false
    var lastValue = 0
    var oper: String = ""
    
    @IBOutlet weak var calculatorLabel: WKInterfaceLabel!

    @IBAction func ac() {
        
        lastValue = 0
        value = 0
        calculatorLabel.setText("\(value)")
        calculateBool = false
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
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
    // Not functional for now
//    @IBAction func point() {
//    }
    @IBAction func add() {
        operatorPressed(op: "Add")
    }
    @IBAction func sub() {
        operatorPressed(op: "Sub")
    }
    @IBAction func multiply() {
        operatorPressed(op: "Multiply")
    }
    @IBAction func divide() {
        operatorPressed(op: "Divide")
    }
    @IBAction func equal() {
        if (calculateBool) {
            
            var tempRes = 0
            
            if (oper == "Add") {
                tempRes = lastValue + value

            } else if (oper == "Sub") {
                tempRes = lastValue - value

            } else if (oper == "Multiply") {
                tempRes = lastValue * value

            } else if (oper == "Divide") {
                tempRes = lastValue / value
                
            } else { // error
            }
            calculatorLabel.setText("\(tempRes)")
            calculateBool = false
            
        } else {
            calculatorLabel.setText("\(value)")
        }
    }
    
    // add numbers when typed
    func addToNumber(num: Int) {
        if (calculateBool) {
                
            if (value == 0) {
                calculatorLabel.setText("\(num)")
                value = num
                
            } else {
                let temp: String = String(value) + String(num)
                value = Int(temp)!
                calculatorLabel.setText(temp)
                }
            
        } else {
            if (value == 0) {
                calculatorLabel.setText("\(num)")
                value = num
                
            } else {
                let temp: String = String(value) + String(num)
                value = Int(temp)!
                calculatorLabel.setText(temp)
                }
        }
    }
    
    func operatorPressed(op: String) {
        if (!calculateBool) {
            lastValue = value
            value = 0
            
            if (op == "Add") {
                oper = "Add"
                calculatorLabel.setText("+")
            } else if (op == "Sub") {
                oper = "Sub"
                calculatorLabel.setText("-")
            } else if (op == "Multiply") {
                oper = "Multiply"
                calculatorLabel.setText("*")
            } else if (op == "Divide") {
                oper = "Divide"
                calculatorLabel.setText("/")
            } else { // error
            }
            calculateBool = true
        }
    }
}
