//
//  GameViewModel.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var moves: [String] = Array(repeating: "", count: 9)
    @Published var isPlaying = true
    @Published var gameOver = false
    @Published var msg = ""
    
    func makeMove(at index: Int) {
        if moves[index] == "" {
            moves[index] = isPlaying ? "X" : "0"
            isPlaying.toggle()
        }
    }
    
    func checkWinner() {
        if checkMoves(player: "X") {
            msg = "Player X Won !!!"
            gameOver.toggle()
        } else if checkMoves(player: "0") {
            msg = "Player 0 Won !!!"
            gameOver.toggle()
        } else {
            let status = moves.contains { $0 == "" }
            if !status {
                msg = "Game over Tied!!!"
                gameOver.toggle()
            }
        }
    }
    
    private func checkMoves(player: String) -> Bool {
        let winPatterns: [[Int]] = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
        ]
        
        return winPatterns.contains { pattern in
            pattern.allSatisfy { moves[$0] == player }
        }
    }
    
    func restartGame() {
        withAnimation(.smooth) {
            moves = Array(repeating: "", count: 9)
            isPlaying = true
            gameOver = false
        }
    }
}
