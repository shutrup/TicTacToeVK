//
//  GameState.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import Foundation

enum GameState {
    case playing(currentPlayer: Player)
    case gameOver(winner: Player?)
}
