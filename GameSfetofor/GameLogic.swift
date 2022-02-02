//
//  GameLogic.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 02.02.2022.
//

import Foundation
import Combine

enum ColorSfetofor: String {
    case red;
    case yellow;
    case green;
}

class GameLogic: ObservableObject {
    let objectWillChange = PassthroughSubject<GameLogic, Never>()
    
    var timer: Timer?
    
    private var step = 0
    private var cycle = 0.0
    private var frequency = 0.5
    private var wins = 0
    private var currentColor: ColorSfetofor = .red
    
    func setValue(cycle: Double, frequency: Double) {
        self.cycle = cycle
        self.frequency = frequency
    }
    
    func killValue() {
        self.step = 0
        self.cycle = 0.0
        self.frequency = 0.5
        self.wins = 0
    }
    
    func startTimer() {
        if Int(cycle) > step {
            timer = Timer.scheduledTimer(
                timeInterval: frequency,
                target: self,
                selector: #selector(updateCycle),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    func getCurrentColor() -> ColorSfetofor {
        currentColor
    }
    
    func checkChoiseColor(choiseColor: String) -> Int {
        if choiseColor == currentColor.rawValue {
            print("Win for \(choiseColor)")
            wins += 1
        } else {
            print("Lose for \(choiseColor)")
        }
        return wins
    }
    
    @objc private func updateCycle() {
        
        if currentColor == .red {
            //print("change red to yellow")
            currentColor = .yellow
        } else if currentColor == .yellow {
            //print("change yellow to green")
            currentColor = .green
        } else if currentColor == .green {
            //print("change green to red")
            currentColor = .red
        }
        
        if step < Int(cycle) {
            step += 1
        } else {
            killTimer()
        }
        print("step: \(step) color: \(currentColor)")
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
