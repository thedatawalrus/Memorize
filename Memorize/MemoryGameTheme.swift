//
//  MemoryGameTheme.swift
//  Memorize
//
//  Created by Sean Curry on 12/7/22.
//

import Foundation

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
        
}



