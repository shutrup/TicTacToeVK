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

    let columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: Constants.Grid.spacing),
        count: 3
    )

    var body: some View {
        LazyVGrid(columns: columns, spacing: Constants.Grid.spacing) {
            ForEach(0..<9) { index in
                GameTileView(symbol: $moves[index], makeMove: { makeMove(index) })
            }
        }
        .padding(Constants.Grid.spacing)
    }
}

