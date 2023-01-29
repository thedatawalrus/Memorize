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

//
//    var themes: Array<MemoryGameTheme.Theme>
//
//    init(){
//        themes = Array<MemoryGameTheme.Theme>()
//
//        themes.append(MemoryGameTheme.sportsTheme)
//        themes.append(MemoryGameTheme.animalTheme)
//        themes.append(MemoryGameTheme.vehicleTheme)
//    }
//    var emojiThemes = Array<MemoryGameTheme<String>.Theme>
//
//    struct createThemes {
//        emojiThemes.append(sportsTheme)
//        emojiThemes.append(animalTheme)
//        emojiThemes.append(vehicleTheme)
//    }

    
//    static let emojis = [
//            ["🚲","🚁","🚑","🛴","🛺","🚆","🚗"," 🏎","🚚","🚎","🏎"], ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏓"],["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨"]
//        ]
    
    static let sportEmojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏓"]

    static let animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨"]

    static let vehicleEmojis = ["🚲","🚁","🚑","🛴","🛺","🚆","🚗","🏎","🚚","🚎"]
    
//    static let sportsTheme = MemoryGameTheme(cardColor:"yellow", pairsOfCards: 4, content: sportEmojis, id:"sports")
    
//    func test() -> Array<MemoryGameTheme.Theme> {
//        MemoryGameTheme(cardColor:"yellow", pairsOfCards: 4, content: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏓"], id:"sports").themes
//
//    }
    
//    static var eThemes = MemoryGameTheme.sportsTheme
    
    static var themes: Array<Theme> = [
        Theme(cardColor:"yellow", pairsOfCards: 10, content: sportEmojis, id:"sports"),
        Theme(cardColor:"blue", pairsOfCards: 10, content: animalEmojis, id:"animals"),
        Theme(cardColor:"red", pairsOfCards: 10, content: vehicleEmojis, id:"vehicles")
    ]
//    
//    init(){
//        themes = Array<Theme>()
//
//        let sportsTheme = Theme(cardColor:"yellow", pairsOfCards: 4, content: EmojiMemoryGame.sportEmojis, id:"sports")
//
//        themes.append(sportsTheme)
//    }
    private var theme:Theme
        
//
//    let animalTheme = MemoryGameTheme<String>.Theme(cardColor:"blue", pairsOfCards: 4, content: animalEmojis, id:"animals")
//
//    let vehicleTheme = MemoryGameTheme<String>.Theme(cardColor:"red", pairsOfCards: 5, content: vehicleEmojis, id:"vehicles")
//
//    var flag:Int
    
//    init(){
//        flag = 0
//    }
    
    static func createMemoryGame(theme:Theme) -> MemoryGame<String> {
//        let pairs = sportsTheme.pairsOfCards
        MemoryGame<String>(numberOfPairsOfCards: theme.pairsOfCards) { pairIndex in
//            animalEmojis[pairIndex]
            theme.content[pairIndex]
            
        }
        
//        flag = start
    }
    
    
//    init(someColor:String, testColor: (String) -> Color) {
//
//        let newColor = testColor(someColor)
////
////        switch someColor {
////        case "red":
////                .red
////        default:
////                .green
////        }
//    }
    
    
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


    
//    var cardColor = newColor(someColor:theme[0].cardColor)
    
    @Published private var model: MemoryGame<String>

//    static var cards: Array<MemoryGame<String>.Card>
    
//    init(model:MemoryGame<String>){
        var cards: Array<MemoryGame<String>.Card> {
            model.cards
        }
    
        var score: Int {
            model.score
        }
    
//        var cardColor: Color {
//            newColor(theme.cardColor)
//        }
        
//    }

//    var cardShuffled = cards.shuffled()
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame(){
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.content.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)

    }
}

//struct EmojiMemoryGame_Previews: PreviewProvider {
//    static var previews: some View {
//        EmojiMemoryGame()
//    }
//}
