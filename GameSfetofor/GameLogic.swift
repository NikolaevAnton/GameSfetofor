//
//  GameLogic.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 02.02.2022.
//

import Foundation
import Combine

class GameLogic: ObservableObject {
    let objectWillChange = PassthroughSubject<GameLogic, Never>()
    
    var timer: Timer?
    
    private var step = 0
    private var cycle = 0.0
    
    func setValue(cycle: Double) {
        self.cycle = cycle
    }
    
    func killValue() {
        self.step = 0
        self.cycle = 0.0
    }
    
    func startTimer() {
        if Int(cycle) > step {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCycle),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @objc private func updateCycle() {
        if step < Int(cycle) {
            step += 1
        } else {
            killTimer()
        }
        print("step: \(step)")
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
}
