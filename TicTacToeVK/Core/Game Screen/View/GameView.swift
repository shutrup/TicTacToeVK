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
        .onChange(of: viewModel.moves) { _ in
            viewModel.checkWinner()
        }
        .alert(isPresented: $viewModel.gameOver) {
            Alert(
                title: Text("Winner"),
                message: Text(viewModel.msg),
                dismissButton: .destructive(Text("Play Again"), action: viewModel.restartGame)
            )
        }
        .navigationTitle("Крестики нолики")
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
