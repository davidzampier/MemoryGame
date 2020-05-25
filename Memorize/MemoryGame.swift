//
//  MemoryGame.swift
//  Memorize
//
//  Created by David Zampier on 20/05/20.
//  Copyright © 2020 David Zampier. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Card chosen: \(card)")
        guard let chosenIndex = self.index(of: card) else {
            return
        }
        self.cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int? {
        return cards.firstIndex { card.id == $0.id }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
