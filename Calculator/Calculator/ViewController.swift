//
//  ViewController.swift
//  Calculator
//
//  Created by Dias on 26.01.2020.
//  Copyright © 2020 Dias Dauletov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let calc = Calculator()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func pressedNumber(_ sender: UIButton) {
        guard
            let numberText = sender.titleLabel?.text,
            let labelText = label.text,
            var labelNum = Double(labelText),
            let number = Double(numberText)
        else {
            return
        }
        labelNum = labelNum * 10 + number
        label.text = String(labelNum)
    }
    
    @IBAction func pressedOperation(_ sender: UIButton) {
        guard
            let numberText = label.text,
            let number = Double(numberText),
            let operation = sender.titleLabel?.text
        else {
            return
        }
        label.text = "0.0"
        calc.setOperand(number: number)
        calc.executeOperation(symbol: operation)
        if(canShow(op: operation)){
            label.text = String(calc.result)
        }
    }
    
    func canShow(op: String) -> Bool{
        if(op != "+" && op != "-" && op != "/" && op != "x" && op != "x^y"){
            return true
        }
        return false
    }
}

