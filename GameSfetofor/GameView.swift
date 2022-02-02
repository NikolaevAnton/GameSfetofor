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

    var body: some View {
        VStack {
            SfetoforView(
                redButton:
                    { currentValue = game.checkChoiseColor(choiseColor: "red")
                    },
                yellowButton:
                    { currentValue = game.checkChoiseColor(choiseColor: "yellow")
                    },
                greenButton:
                    { currentValue = game.checkChoiseColor(choiseColor: "green")
                    },
                game: game
            )
            Spacer()
            Text("value: \(currentValue)\n color: \(game.getCurrentColor().rawValue)")
            CustomButtonView(currentFunc: {
                game.killValue()
                currentView = .settings
            }, currentLabel: "Перейти в настройки")
            CustomButtonView(currentFunc: {
                game.killValue()
                currentView = .start
            }, currentLabel: "Закончить игру")
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentView: .constant(.game), game: GameLogic())
    }
}
