//
//  Card.swift
//  Concentration
//
//  Created by Dias on 15.02.2020.
//  Copyright © 2020 Dias Dauletov. All rights reserved.
//

import Foundation

struct Card{
    var isFaceUp = false;
    var isMatched = false;
    var identifier : Int;
    
    static var identifierNumber : Int = 0;
    
    init () {
        self.identifier = Card.identifierNumber;
        Card.identifierNumber += 1;
    }
}
