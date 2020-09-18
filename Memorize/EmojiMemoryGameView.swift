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
        Grid(items: viewModel.cards) { card in
                Cardviwe(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
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
        GeometryReader(content: { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    Text(card.content)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                    }
            }
            .font(Font.system(size: min(geometry.size.width,geometry.size.height)*fontScaleFactor))
        })

    }
    // MARK: - 控制绘制常量的面板
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 4
    let fontScaleFactor: CGFloat = 1
}
