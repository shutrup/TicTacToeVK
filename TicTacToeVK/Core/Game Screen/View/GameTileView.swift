//
//  GameTileView.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import SwiftUI

struct GameTileView: View {
    @Binding var symbol: String
    var makeMove: () -> Void
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Color.blue

            backgroundColor
                .opacity(symbol == "" ? 1 : 0)
                .animation(.none)

            Text(symbol)
                .font(.system(size: 55))
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .opacity(symbol != "" ? 1 : 0)
        }
        .frame(width: GameView.getWidth(), height: GameView.getWidth())
        .cornerRadius(25)
        .rotation3DEffect(
            .init(degrees: symbol != "" ? 180 : 0),
            axis: (x: 0.0, y: 1.0, z: 0.0),
            anchor: .center,
            anchorZ: 0.0,
            perspective: 1.0
        )
        .onTapGesture {
            withAnimation(.smooth) {
                makeMove()
            }
        }
    }

    private var backgroundColor: Color {
        colorScheme == .dark ? .white : .black
    }
}

#Preview {
    GameView()
}
