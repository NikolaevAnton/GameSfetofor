//
//  GameView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

struct GameView: View {
    @Binding var currentView: Navigation
    
    @State var currentValue = ""

    var body: some View {
        VStack {
            SfetoforView(
                redButton:
                    { currentValue = "red"},
                yellowButton:
                    { currentValue = "yellow"},
                greenButton:
                    { currentValue = "green"}
            )
            Spacer()
            Text("value: \(currentValue)")
            CustomButtonView(currentFunc: {
                currentView = .settings
            }, currentLabel: "Перейти в настройки")
            CustomButtonView(currentFunc: {
                currentView = .start
            }, currentLabel: "Закончить игру")
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(currentView: .constant(.game))
    }
}
