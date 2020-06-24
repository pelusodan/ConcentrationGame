//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Daniel Peluso on 5/31/20.
//  Copyright © 2020 Daniel Peluso. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFacedUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    var themes = [Theme]()
    private var emojiDict = [Int:String]()
    // for saving theme we will be removing from
    private var currThemeEmojis = [String]()
    
    // we should track the score and flipCount in this class
    var score: Int = 0
    var flipCount: Int = 0
    
    init(numberOfPairsOfCards: Int, themes: [Theme]!){
        for _ in 0 ..< numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        // easy peasy thanks to the shuffle function
        cards.shuffle()
        // setting the themes and randomizing one for the game
        self.themes = themes
        pickNewTheme()
    }
    
    //
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else {
                    // neither cards match
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFacedUp = false
                    }
                    score -= 1
                }
            }
            cards[index].isFacedUp = true
            indexOfOneAndOnlyFaceUpCard = index
            flipCount += 1
        }
        
    }
    
    func reset() {
        for i in cards.indices {
            cards[i].isFacedUp = false
            cards[i].isMatched = false
        }
        // to yet again randomize the order
        cards.shuffle()
        // reset the emoji dictionary for a new game
        emojiDict.removeAll()
        // new game, new theme!
        pickNewTheme()
        score = 0
        flipCount = 0
    }

    func emoji(for card: Card) -> String {
        if emojiDict[card.identifier] == nil, currThemeEmojis.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(currThemeEmojis.count)))
            emojiDict[card.identifier] = currThemeEmojis.remove(at: randomIndex)
        }
        return emojiDict[card.identifier] ?? "?"
    }
    
    // helper for getting a random theme and replace themes
    private func pickNewTheme() {
        let themeSelection = Int(arc4random_uniform(UInt32(themes.count)))
        print(themeSelection)
        currThemeEmojis = themes[themeSelection].emojiChoices
    }
    func getScoreAndFlipCount() -> (score: Int, flipCount: Int){
        return (self.score,self.flipCount)
    }
}
