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
        Grid(viewModel.cards) { card in
                Cardviwe(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding()
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
                    Pie(startAngle: Angle.degrees(0-90),endAngle: Angle.degrees(110-90),clockwise: true).padding(5).opacity(0.4)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: 10.0).fill()
                    }
                  }
            }
            .font(Font.system(size: min(geometry.size.width,geometry.size.height)*fontScaleFactor))
        })

    }
    // MARK: - 控制绘制常量的面板
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 4
    private let fontScaleFactor: CGFloat = 0.8
}
