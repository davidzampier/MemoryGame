//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by David Zampier on 20/05/20.
//  Copyright © 2020 David Zampier. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    
    init() {
        let emojis = ["🍕", "🍗", "🍔", "🌭", "🥓"]
        model = MemoryGame<String>(numberOfPairs: (2...5).randomElement()!) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
