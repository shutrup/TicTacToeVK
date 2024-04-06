//
//  GameBoardView.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import SwiftUI

struct GameBoardView: View {
    @Binding var moves: [String]
    var makeMove: (Int) -> Void

    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(0..<9) { index in
                GameTileView(symbol: $moves[index], makeMove: { makeMove(index) })
            }
        }
        .padding(15)
    }
}
