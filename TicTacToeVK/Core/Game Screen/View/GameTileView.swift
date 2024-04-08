//
//  GameTileView.swift
//  TicTacToeVK
//
//  Created by Шарап Бамматов on 06.04.2024.
//

import SwiftUI

struct GameTileView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var symbol: String
    var makeMove: () -> Void

    var body: some View {
        ZStack {
            Color.blue

            backgroundColor

            title
        }
        .frame(width: width, height: width)
        .cornerRadius(25)
        .rotation3DEffect(
            Angle(degrees: symbol != "" ? 180 : 0),
            axis: (x: .zero, y: 1.0, z: .zero)
        )
        .onTapGesture {
            withAnimation(.smooth) {
                makeMove()
            }
        }
    }
}

private extension GameTileView {
    @ViewBuilder
    var backgroundColor: some View {
        (colorScheme == .dark ? Color.white : Color.black)
            .opacity(symbol == "" ? 1 : 0)
            .animation(.none)
    }
    
    var title: some View {
        Text(symbol)
            .font(.system(size: 55))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .opacity(symbol != "" ? 1 : 0)
    }
    
    var width: CGFloat {
        return (UIScreen.main.bounds.width - 60) / 3
    }
}
