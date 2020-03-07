//
//  ViewController.swift
//  MidTerm
//
//  Created by Dias on 07.03.2020.
//  Copyright © 2020 BrightSun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var model = Model(numOfLamps: 4);
    
    
    @IBOutlet var colorButtons: [UIButton]!
    
    @IBOutlet var lampButtons: [UIButton]!
    
    var colIndex = 2;
    
    @IBAction func clickedButton(_ sender: UIButton) {
        showColors();
        if let index = lampButtons.firstIndex(of: sender){
            model.chooseLamp(at: index, color: colIndex)
        }
    }
    
    
    
    @IBAction func clickedColorButton(_ sender: UIButton) {
        if(sender.backgroundColor == #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)) {
            colIndex = 0;
        }
        if(sender.backgroundColor == #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)) {
            colIndex = 1;
        }
        showLamps()
    }
    func showColors() {
        var i = 0;
        for button in lampButtons {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            i += 1;
        }
        colorButtons[0].backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1);
        colorButtons[1].backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1);
    }
    
    func showLamps(){
        colorButtons[0].backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0);
        colorButtons[1].backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 0);
        for index in 0..<lampButtons.count {
            let button = lampButtons[index]
            let lamp = model.lamps[index]
            button.backgroundColor = colors[lamp.color]
        }
    }
    
    var colors: [Int: UIColor] = [0 : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), 1 : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), 2 : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0)];
    
}

