//
//  CustomButtonView.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

struct CustomButtonView: View {
    
    var currentFunc: () -> Void
    var currentLabel: String
    
    var body: some View {
        Button(action: {
            currentFunc()
        }
        ) {
            Text(currentLabel)
                .font(.largeTitle)
                .foregroundColor(.red)
        }
        .frame(width: 350, height: 50)
        .background(Color.brown)
        .cornerRadius(20)
        .padding(.bottom, 10.0)
    }
    
}


struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(currentFunc: {}, currentLabel: "Настройка Игры")
    }
}
