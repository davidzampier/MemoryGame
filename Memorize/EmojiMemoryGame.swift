//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by David Zampier on 20/05/20.
//  Copyright © 2020 David Zampier. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String>
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    init() {
        let emojis = ["👻", "🎃"]
        model = MemoryGame<String>(numberOfPairs: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
