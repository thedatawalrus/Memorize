//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sean Curry on 11/17/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    
    init(){
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.content.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }


    static let sportEmojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏓"]

    static let animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨"]

    static let vehicleEmojis = ["🚲","🚁","🚑","🛴","🛺","🚆","🚗","🏎","🚚","🚎"]
    
    
    static var themes: Array<Theme> = [
        Theme(cardColor:"yellow", pairsOfCards: 10, content: sportEmojis, id:"sports"),
        Theme(cardColor:"blue", pairsOfCards: 10, content: animalEmojis, id:"animals"),
        Theme(cardColor:"red", pairsOfCards: 10, content: vehicleEmojis, id:"vehicles")
    ]

    private var theme:Theme
        

    
    static func createMemoryGame(theme:Theme) -> MemoryGame<String> {

        MemoryGame<String>(numberOfPairsOfCards: theme.pairsOfCards) { pairIndex in

            theme.content[pairIndex]
            
        }
        
    }
    
    
    
    var themeName:String {
        switch theme.id {
        case "animals":
            return "Animals"
        case "sports":
            return "Sports"
        case "vehicles":
            return "Transportation"
        default:
            return "No Theme"
        }
    }
    
    var newColor:Color {
        switch theme.cardColor {
        case "red":
            return .red
        case "yellow":
            return .yellow
        case "blue":
            return .blue
        default:
            return .green
        }
    }


    
    @Published private var model: MemoryGame<String>

        var cards: Array<MemoryGame<String>.Card> {
            model.cards
        }
    
        var score: Int {
            model.score
        }
    
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame(){
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.content.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)

    }
}
