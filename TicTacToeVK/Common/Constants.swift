//
//  Constants.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import Foundation

struct Constants {
    struct Game {
        static let navigationTitle = "Крестики-нолики"
        static let gameOverTitle = "Игра закончена"
        static let playAgainButton = "Играть снова"
        
        static let winnerMessagePrefix = "Игрок"
        static let winnerMessageSuffix = "Выиграл!"
        static let tiedMessage = "Ничья!"
    }
    
    struct Grid {
        static let spacing: CGFloat = 15.0
    }
}
