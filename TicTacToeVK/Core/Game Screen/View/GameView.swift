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
        VStack {
            GameBoardView(moves: $viewModel.moves, makeMove: viewModel.makeMove)
        }
        .alert(isPresented: Binding<Bool>(
            get: { viewModel.gameOver },
            set: { _ in }
        )) {
            Alert(
                title: Text(Constants.Game.gameOverTitle),
                message: Text(viewModel.winnerMessage),
                dismissButton: .destructive(Text(Constants.Game.playAgainButton), action: viewModel.restartGame)
            )
        }
        .navigationTitle(Text(Constants.Game.navigationTitle))
    }
}

#Preview {
    NavigationView {
        GameView()
    }
}

extension GameView {
    static func getWidth() -> CGFloat {
        let width = UIScreen.main.bounds.width - (30 + 30)
        return width / 3
    }
}
