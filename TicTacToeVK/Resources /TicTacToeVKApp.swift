//
//  TicTacToeVKApp.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import SwiftUI

@main
struct TicTacToeVKApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                GameScreen()
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
