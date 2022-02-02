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
    
    @State var currentValue = ""

    var body: some View {
        VStack {
            SfetoforView(
                redButton:
                    {
                        game.startTimer()
                        currentValue = "red"},
                yellowButton:
                    { currentValue = "yellow"},
                greenButton:
                    { currentValue = "green"}
            )
            Spacer()
            Text("value: \(currentValue)")
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
