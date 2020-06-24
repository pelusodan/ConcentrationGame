//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Daniel Peluso on 5/31/20.
//  Copyright © 2020 Daniel Peluso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards,
                                                 themes: [Theme.ANIMALS,Theme.FRUIT,Theme.PEOPLE,Theme.TECH, Theme.APPLE,Theme.WORKERS,Theme.SPORTBALL])
    var  numberOfPairsOfCards: Int {
        return (cardButtons.count+1) / 2
    }

    // FlipCount and Score labels
    @IBOutlet weak var flipCountLabel: UILabel!
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flip Count: \(flipCount)"
        }
    }
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0 {
        didSet {
            scoreLabel.text = "Score : \(score)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    // Button stuff
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Error in card numbering")
        }
        flipCount += 1
        flipCountLabel.text = "Flip Count: \(flipCount)"
    }
    @IBAction func newGameClick(_ sender: UIButton) {
        game.reset()
        // update the UI to match
        updateViewFromModel()
    }
    
    // to keep the view updated to game
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(game.emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 0): #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 1)
            }
        }
        // so our views stay active
        (score, flipCount) = game.getScoreAndFlipCount()
    }
}

