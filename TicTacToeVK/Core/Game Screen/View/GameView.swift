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
            GameBoardView(moves: .constant([""]), makeMove: { _ in })
        }
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
