//
//  Card.swift
//  ConcentrationGame
//
//  Created by Daniel Peluso on 6/1/20.
//  Copyright © 2020 Daniel Peluso. All rights reserved.
//

import Foundation

struct Card {
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    // ID generator
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
