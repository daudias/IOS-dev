//
//  Concentration.swift
//  Concentration
//
//  Created by Dias on 15.02.2020.
//  Copyright © 2020 Dias Dauletov. All rights reserved.
//

import Foundation

class Concentration {
    var cards = Array <Card>();
    var usedCards = Array<Bool>()
    var score = 0
    
    var indexOfOnlyOneFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = indexOfOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    score += 3
                }
                if usedCards[matchIndex] || usedCards[index] {
                    score -= 1
                }
                indexOfOnlyOneFaceUpCard = nil
                usedCards[index] = true
                usedCards[matchIndex] = true
            }
            else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                indexOfOnlyOneFaceUpCard = index
            }
            cards[index].isFaceUp = true
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards{
            let card = Card();
            cards.append(card);
            cards.append(card);
        }
        usedCards = Array(repeating: false, count: numberOfPairsOfCards * 2)
        //Shuffle the cards
        for index in cards.indices {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let temp = cards[index]
            cards[index] = cards[randomIndex]
            cards[randomIndex] = temp
        }
    }
}
