//
//  GameSfetoforApp.swift
//  GameSfetofor
//
//  Created by Anton Nikolaev on 29.01.2022.
//

import SwiftUI

enum Navigation {
    case start;
    case settings;
    case game;
}

@main
struct GameSfetoforApp: App {
    
    @State private var currentView: Navigation = .start
    
    var body: some Scene {
        WindowGroup {
            switch currentView {
            case .start:
                StartView(currentView: $currentView)
            case .settings:
                SettingsView(currentView: $currentView)
            case .game:
                GameView(currentView: $currentView)
            }
        }
    }
}
