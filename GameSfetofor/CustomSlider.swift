//
//  CustomSlider.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 02.02.2022.
//

import SwiftUI

struct CustomSlider: View {
    let min: Double
    let max: Double
    @Binding var value: Double
    private var step: Double {
        if min < 1.0 {
            return 0.1
        } else {
            return 1
        }
    }
    var body: some View {
        HStack {
            Text("\(String(format: "%g", min))")
            Slider(value: $value, in: min...max, step: step)
            Text("\(String(format: "%g", max))")
        }.padding()
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(min: 0.1, max: 1.0, value: .constant(0.1))
    }
}
