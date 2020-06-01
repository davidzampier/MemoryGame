//
//  MemoryGame.swift
//  Memorize
//
//  Created by David Zampier on 20/05/20.
//  Copyright © 2020 David Zampier. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var indexOfTheOnlyOneFaceUpCard: Int? {
        get {
            cards.indices.filter{ cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
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
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatched = indexOfTheOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatched].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatched].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyOneFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
