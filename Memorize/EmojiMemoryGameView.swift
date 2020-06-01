//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by David Zampier on 19/05/20.
//  Copyright © 2020 David Zampier. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }.padding(5)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
           ZStack {
                PieView(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90)).padding(5).opacity(0.35)
                Text(card.content).font(font(for: size))
            }.cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    //MARK: - Drawing Constants
    private let fontScaleFactor: CGFloat = 0.7
    
    private func font(for size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * fontScaleFactor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
