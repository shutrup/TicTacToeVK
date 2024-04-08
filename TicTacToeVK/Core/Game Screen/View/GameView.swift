//
//  ContentView.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()

    var body: some View {
        GameBoardView(moves: $viewModel.moves, makeMove: viewModel.makeMove)
            .alert(isPresented: Binding<Bool>(
                get: { viewModel.gameOver },
                set: { _ in }
            )) { previewAlert }
            .navigationTitle(Text(Constants.Game.navigationTitle))
    }
}

private extension GameView {
    var previewAlert: Alert {
        Alert(
            title: Text(Constants.Game.gameOverTitle),
            message: Text(viewModel.winnerMessage),
            dismissButton: .destructive(Text(Constants.Game.playAgainButton), action: viewModel.restartGame)
        )
    }
}

#Preview {
    NavigationView {
        GameView()
    }
}
