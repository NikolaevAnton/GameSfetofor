//
//  SettingsView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var currentView: Navigation
    @ObservedObject var game: GameLogic
    
    @State private var cycle = 10.0
    @State private var frequency = 0.5
    @State private var attempt = 2.0
    
    var body: some View {
        VStack {
            Text("Количество циклов: \(Int(cycle))")
            CustomSlider(min: 10, max: 100, value: $cycle)
            Text("время задержки на цвете: \(String(format: "%g", frequency)) секунд")
            CustomSlider(min: 0.1, max: 1.0, value: $frequency)
            Text("количество попыток: \(Int(attempt))")
            CustomSlider(min: 1.0, max: 10.0, value: $attempt)
            Spacer()
            CustomButtonView(currentFunc: {
                game.setValue(cycle: cycle, frequency: frequency, attempt: attempt)
                game.startTimer()
                currentView = .game
            }, currentLabel: "Начать игру")
            CustomButtonView(currentFunc: {
                currentView = .start
            }, currentLabel: "Перейти к описанию")
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(currentView: .constant(.settings), game: GameLogic())
    }
}
