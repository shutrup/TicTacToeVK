//
//  GameViewModel.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var moves: [String] = Array(repeating: "", count: 9)
    @Published private(set) var gameState: GameState = .playing(currentPlayer: .x)
    
    private let winPatterns: [[Int]] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]
    
    var gameOver: Bool {
        if case .gameOver = gameState {
            return true
        }
        return false
    }
    
    var winnerMessage: String {
        switch gameState {
        case .gameOver(let winner):
            if let winner = winner {
                return "\(Constants.Game.winnerMessagePrefix) \(winner.rawValue) \(Constants.Game.winnerMessageSuffix)"
            } else {
                return Constants.Game.tiedMessage
            }
        default:
            return ""
        }
    }
    
    func makeMove(at index: Int) {
        guard case let .playing(currentPlayer) = gameState, moves[index].isEmpty else { return }
        
        moves[index] = currentPlayer.rawValue
        
        if checkWinner(player: currentPlayer) {
            gameState = .gameOver(winner: currentPlayer)
        } else if isBoardFull() {
            gameState = .gameOver(winner: nil)
        } else {
            gameState = .playing(currentPlayer: currentPlayer.next)
        }
    }
    
    private func checkWinner(player: Player) -> Bool {
        winPatterns.contains { pattern in
            pattern.allSatisfy { moves[$0] == player.rawValue }
        }
    }
    
    private func isBoardFull() -> Bool {
        !moves.contains("")
    }
    
    func restartGame() {
        withAnimation {
            moves = Array(repeating: "", count: 9)
            gameState = .playing(currentPlayer: .x)
        }
    }
}

