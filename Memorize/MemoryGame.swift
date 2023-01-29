//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sean Curry on 11/17/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    var score = 0
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card:Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    
                }
                else {
                    if cards[potentialMatchIndex].haveFlipped == false {
                        cards[potentialMatchIndex].haveFlipped.toggle()
                    }
                    else {
                        score -= 1
                    }
                    if cards[chosenIndex].haveFlipped == false {
                        cards[chosenIndex].haveFlipped.toggle()
                    }
                    else {
                        score -= 1
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
                

            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
            
        }
//        print("\(cards)")
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards = cards.shuffled()
    }
    
    
    struct Card: Identifiable {
        var haveFlipped: Bool = false
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
}
