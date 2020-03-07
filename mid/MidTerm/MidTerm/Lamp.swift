//
//  Lamp.swift
//  MidTerm
//
//  Created by Dias on 07.03.2020.
//  Copyright © 2020 BrightSun. All rights reserved.
//

import Foundation

class Lamp{
    var color = 0;
    var identifier : Int;
    
    static var identifierNumber : Int = 0;
    init () {
        self.identifier = Lamp.identifierNumber;
        Lamp.identifierNumber += 1;
    }
}
