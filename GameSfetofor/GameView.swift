//
//  GameView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

struct GameView: View {
    @Binding var currentView: Navigation

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
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
