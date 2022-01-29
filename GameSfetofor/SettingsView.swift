//
//  SettingsView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var currentView: Navigation
    @State var currentValue = 10.0
    
    var body: some View {
        VStack {
            Text("Количество циклов: \(Int(currentValue))")
            HStack {
                Text("10")
                Slider(value: $currentValue, in: 10...100, step: 1)
                Text("100")
            }.padding()
            Spacer()
            CustomButtonView(currentFunc: {
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
        SettingsView(currentView: .constant(.settings))
    }
}
