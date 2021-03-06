//
//  SfetoforView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 02.02.2022.
//

import SwiftUI

struct SfetoforView: View {
    
    var redButton: () -> Void
    var yellowButton: () -> Void
    var greenButton: () -> Void
    @ObservedObject var game: GameLogic
    
    
    var body: some View {
        VStack {
            Button {
                redButton()
            } label: {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 100)
                    .opacity(game.getCurrentColor() == .red ? 1.0 : 0.5)
            }
            Button {
                yellowButton()
            } label: {
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 100)
                    .opacity(game.getCurrentColor() == .yellow ? 1.0 : 0.5)
            }
            Button {
                greenButton()
            } label: {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 100)
                    .opacity(game.getCurrentColor() == .green ? 1.0 : 0.5)
            }
        }
        .frame(height: 400)
    }
    

}

struct SfetoforView_Previews: PreviewProvider {
    static var previews: some View {
        SfetoforView(redButton: {}, yellowButton: {}, greenButton: {}, game: GameLogic())
    }
}
