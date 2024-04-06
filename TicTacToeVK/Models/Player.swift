//
//  Player.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import Foundation

enum Player: String {
    case x = "X"
    case o = "O"
    
    var next: Player {
        self == .x ? .o : .x
    }
}
