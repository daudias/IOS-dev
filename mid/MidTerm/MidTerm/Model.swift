//
//  Model.swift
//  MidTerm
//
//  Created by Dias on 07.03.2020.
//  Copyright © 2020 BrightSun. All rights reserved.
//

import Foundation

class Model{
    var lamps = Array<Lamp>();
    
    func chooseLamp(at index: Int, color : Int){
        lamps[index].color = color;
    }
    
    init(numOfLamps : Int){
        for _ in 0..<numOfLamps {
            let lamp = Lamp();
            lamps.append(lamp);
        }
    }
}
