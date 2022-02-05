//
//  GameView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

struct GameView: View {
    @Binding var currentView: Navigation
    @ObservedObject var game: GameLogic
    
    @State var currentValue = 0
    @State private var isLose = false
    @State private var isEndGame = false


    var body: some View {
        VStack {
            SfetoforView(
                redButton:
                    {
                        currentValue = game.checkChoiseColor(choiseColor: "red")
                        isLose = game.isLoseGame()
                        isEndGame = game.isEndGame
                    },
                yellowButton:
                    {
                        currentValue = game.checkChoiseColor(choiseColor: "yellow")
                        isLose = game.isLoseGame()
                        isEndGame = game.isEndGame
                    },
                greenButton:
                    {
                        currentValue = game.checkChoiseColor(choiseColor: "green")
                        isLose = game.isLoseGame()
                        isEndGame = game.isEndGame
                    },
                game: game
            )
            Spacer()
            Text("value: \(currentValue)\n color: \(game.getCurrentColor().rawValue)\n end: \(String(game.isEndGame))")
            CustomButtonView(currentFunc: {
                game.killValue()
                currentView = .settings
            }, currentLabel: "Перейти в настройки")
            CustomButtonView(currentFunc: {
                game.killValue()
                currentView = .start
            }, currentLabel: "Закончить игру")
        }
        .alert("Lose\n Вы не справились в отведенное число попыток", isPresented: $isLose) {
            Button("OK", role: .cancel) {
                game.killValue()
                currentView = .settings
            }
        }
        .alert("Конец игры", isPresented: $isEndGame) {
            VStack {
                Text("Количество попаданий: \(currentValue)")
                Button("OK", role: .cancel) {
                    game.killValue()
                    currentView = .settings
                }
            }
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentView: .constant(.game), game: GameLogic())
    }
}
