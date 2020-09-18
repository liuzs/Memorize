//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by sanxi on 2020/9/8.
//  Copyright © 2020 sanxi. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                Cardviwe(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
            .foregroundColor(Color.orange)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

struct Cardviwe: View {
    var card:MemoryGame<String>.Card
    
    var body: some View{
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 4)
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
    }
}
}
}
