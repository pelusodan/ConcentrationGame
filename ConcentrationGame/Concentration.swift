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
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int){
        for _ in 0 ..< numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        // easy peasy thanks to the shuffle function
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                } else {
                    // neither cards match
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFacedUp = false
                    }
                }
            }
            cards[index].isFacedUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    
    func reset() {
        for i in cards.indices {
            cards[i].isFacedUp = false
            cards[i].isMatched = false
        }
        // to yet again randomize the order
        cards.shuffle()
    }
}
