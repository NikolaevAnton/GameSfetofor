//
//  ContentView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

struct StartView: View {
    
    @Binding var currentView: Navigation
    
    var body: some View {
        VStack {
            Text("Игра со светофором\nВы регулировщик движения на перекрестке\nВаш светофор сбесился, для его остановки нужно нажать на цвет который загорелся")
                .fontWeight(.heavy)
                .foregroundColor(.cyan)
                .italic()
                .font(.largeTitle)
            Spacer()
            CustomButtonView(currentFunc: {
                currentView = .settings
            }, currentLabel: "Настройка Игры")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(currentView: .constant(.start))
    }
}
