//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Sean Curry on 12/7/22.
//

import Foundation

//struct MemoryGameTheme {
//
//    let sportsTheme:MemoryGameTheme.Theme
//    let animalTheme:MemoryGameTheme.Theme
//    let vehicleTheme:MemoryGameTheme.Theme
//
//    let sportEmojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏓"]
//
//    let animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨"]
//
//    let vehicleEmojis = ["🚲","🚁","🚑","🛴","🛺","🚆","🚗"," 🏎","🚚","🚎","🏎"]
//
//    var themes: Array<Theme>
//
//    init(cardColor: String, pairsOfCards: Int, content: Array<String>, id:String) {
//
//        themes = Array<Theme>()
//
////        init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
////            cards = Array<Card>()
////            //add numberOfPairsOfCards x 2 cards to cards array
////            for pairIndex in 0..<numberOfPairsOfCards {
////                let content = createCardContent(pairIndex)
////                cards.append(Card(content: content, id: pairIndex*2))
////                cards.append(Card(content: content, id: pairIndex*2+1))
////            }
////        }
//
////        self.sportsTheme = MemoryGameTheme.Theme(cardColor:"yellow", pairsOfCards: 4, content: sportEmojis, id:"sports")
////
////        self.animalTheme = MemoryGameTheme.Theme(cardColor:"blue", pairsOfCards: 4, content: animalEmojis, id:"animals")
////
////        self.vehicleTheme = MemoryGameTheme.Theme(cardColor:"red", pairsOfCards: 5, content: vehicleEmojis, id:"vehicles")
//
//        themes.append(Theme(cardColor: cardColor, pairsOfCards: pairsOfCards, content: content, id: id))
////        themes.append(animalTheme)
////        themes.append(vehicleTheme)
//    }

    struct Theme {
        var cardColor: String
        var pairsOfCards: Int
        var content: Array<String>
        var id: String
        
        init(cardColor: String, pairsOfCards: Int, content: Array<String>, id: String) {
            self.cardColor = cardColor
            self.pairsOfCards = pairsOfCards > content.count ? content.count : pairsOfCards
            self.content = content
            self.id = id
        }
        
//    }
    
//    private(set) var sportsTheme: Theme
    
//    init() {
//        let sportEmojis = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏓"]
//
//        self.sportsTheme = Theme(cardColor:"yellow", pairsOfCards: 4, content: sportEmojis as! CardContent, id:"sports")
//
//    }
//    func print_theme () {
//        print(sportsTheme)
//    }

}



