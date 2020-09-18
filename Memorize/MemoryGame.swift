//
//  MemoryGame.swift
//  Memorize
//
//  Created by sanxi on 2020/9/10.
//  Copyright © 2020 sanxi. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(_ card: Card){
        print("card chosen\(card)")
        let chosenIndex: Int = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0 // TODO:假的
    }
    
    init(nubmerOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        // 创建空数组
        for pairIndex in 0..<nubmerOfPairsOfCards{
        let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2))
            cards.append(Card(isFaceUp: true, isMatched: false, content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}
