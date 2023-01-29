//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sean Curry on 10/24/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel:game)
        }
    }
}
