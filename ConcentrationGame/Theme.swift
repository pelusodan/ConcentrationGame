//
//  Theme.swift
//  ConcentrationGame
//
//  Created by Daniel Peluso on 6/3/20.
//  Copyright © 2020 Daniel Peluso. All rights reserved.
//

import Foundation

struct Theme {
    
    var emojiChoices = [String]()
    
    init(emojiChoices: [String]!) {
        self.emojiChoices = emojiChoices
    }
    
    static var FRUIT = Theme(emojiChoices: ["🍏","🍎","🍋","🍒","🍑","🍉","🥝", "🍇"])
    static var PEOPLE = Theme(emojiChoices: ["😇","😖","😍","🤓","😎","😗","😨","🤪"])
    static var ANIMALS = Theme(emojiChoices: ["🐶","🐹","🐸","🐥","🐙","🐷","🦗","🐍"])
    static var WORKERS = Theme(emojiChoices: ["👮‍♂️","👨‍🔧","👩‍🌾","👩‍✈️","👨‍🎓","🧑‍🎤","🧑‍💻","🦸‍♀️"])
    static var APPLE = Theme(emojiChoices: ["💻","📱","🖥","⌚️","⌨️","🖱","🖨","🖲"])
    static var TECH = Theme(emojiChoices: ["💾","📺","📡","⚙️","🎛","🔌","⏰","🔋"])
    static var SPORTBALL = Theme(emojiChoices: ["⚽️","🏀","🏈","⚾️","🥎","🏐","🏉","🎱"])
}
