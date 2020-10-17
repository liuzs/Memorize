//
//  MemoryGame.swift
//  Memorize
//
//  Created by sanxi on 2020/9/10.
//  Copyright © 2020 sanxi. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneOnlyUpCard: Int?
    
    mutating func choose(_ card: Card){
        print("card chosen\(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentiaMatchIndex = indexOfTheOneOnlyUpCard {
                if cards[chosenIndex].content == cards[potentiaMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentiaMatchIndex].isMatched = true
                }
                indexOfTheOneOnlyUpCard = nil
            } else {
                for index in cards.indices {
                        cards[index].isFaceUp = false
                }
                indexOfTheOneOnlyUpCard = chosenIndex
            }
            
            self.cards[chosenIndex].isFaceUp = true
        }
    }
    
    
    init(nubmerOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        // 创建空数组
        for pairIndex in 0..<nubmerOfPairsOfCards{
        let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        var id: Int
    }
}
