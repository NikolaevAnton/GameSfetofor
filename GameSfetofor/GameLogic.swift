//
//  GameLogic.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 02.02.2022.
//

import SwiftUI
import Combine

enum ColorSfetofor: String {
    case red;
    case yellow;
    case green;
}

class GameLogic: ObservableObject {
    
    var isEndGame = false
    
    let objectWillChange = PassthroughSubject<GameLogic, Never>()
    
    var timer: Timer?
    
    private var step = 0
    private var cycle = 0.0
    private var frequency = 0.5
    private var wins = 0
    private var currentColor: ColorSfetofor = .red
    private var attempt = 2.0
    
    func setValue(cycle: Double, frequency: Double, attempt: Double) {
        self.cycle = cycle
        self.frequency = frequency
        self.attempt = attempt
    }
    
    func killValue() {
        self.step = 0
        self.cycle = 0.0
        self.frequency = 0.5
        self.wins = 0
        self.attempt = 2.0
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
            wins += 1
        } else {
            attempt -= 1
            if attempt == 0 {
                killTimer()
                print("stooop")
            }
        }
        return wins
    }
    
    func isLoseGame() -> Bool {
        if attempt == 0 {
            return true
        }
        return false
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
            endGame()
            killTimer()
            return
        }
        print("step: \(step) color: \(currentColor)")
        objectWillChange.send(self)
    }
    
    private func endGame() {
        isEndGame = true
        print("End game")
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
        objectWillChange.send(self)
    }
}
