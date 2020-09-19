//
//  EmojiMemoryGame.swift
//  Memorize
//  ViewModel
//  Created by sanxi on 2020/9/10.
//  Copyright © 2020 sanxi. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["🍕","🍥","🍔","🥗"]
        return MemoryGame<String>(nubmerOfPairsOfCards: emojis.count, cardContentFactory: {(pairIndex: Int) -> String in
        emojis[pairIndex]
        })}
    //MARK: -Access to the Model
    var cards: Array<MemoryGame<String>.Card>{
    model.cards
    }

    //MARK: -Intent

    func choose(card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
