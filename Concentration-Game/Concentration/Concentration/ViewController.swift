//
//  ViewController.swift
//  Concentration
//
//  Created by Dias on 15.02.2020.
//  Copyright © 2020 Dias Dauletov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func clickedButton(_ sender: UIButton) {
        if let index = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: index)
            updateViewFromModel()
        }
    }
    @IBAction func updateScore(_ sender: UIButton) {
        scoreLabel.text = "Score: \(game.score)"
    }
    
    func updateViewFromModel() {
        for index in 0..<cardButtons.count {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
    
    @IBAction func clickedNewGameButton(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emoji = Dictionary<Int, String>()
        for button in themeButtons {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        for button in cardButtons {
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            button.setTitle("", for: UIControl.State.normal)
        }
    }
    
    @IBAction func clickedThemeButton(_ sender: UIButton) {
        if let themeTitle = sender.currentTitle {
            if let theme = themes[themeTitle] {
                emojiChoises = theme
                for button in themeButtons {
                    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }
            }
        }
        updateViewFromModel()
    }
    
    
    @IBOutlet var themeButtons: [UIButton]!
    
    var themes: [String : Array <String>] = [
        "Fruits" : ["🍏", "🍎", "🍐", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🥭", "🍍", "🥑"],
        "Animals" : ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐼", "🐨", "🐯", "🦁", "🐮", "🐷", "🐸", "🐵"],
        "Sport" : ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🥊"],
        "Hurts" : ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤎", "💔", "❣️", "💕", "💞", "💝", "💘"],
        "Flags" : ["🇰🇿", "🇯🇴", "🏳️‍🌈", "🇧🇾", "🇺🇸", "🇨🇦", "🇧🇷", "🇦🇺", "🇩🇪", "🇱🇺", "🇵🇱", "🇷🇺", "🇨🇭", "🇬🇧"],
        "Hands" : ["🤲", "👐", "👍", "🤝", "🦾", "🖕🏿", "🦶🏽", "🤏🏻", "✍🏻", "🦵🏿", "🤘🏽", "🤞🏻", "🤛🏾", "👌🏻"],
    ]
    
    var emojiChoises = Array <String>()
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card : Card) -> String {
        if emoji[card.identifier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoises.count)))
            emoji[card.identifier] = emojiChoises.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

