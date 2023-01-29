//
//  ContentView.swift
//  Memorize
//
//  Created by Sean Curry on 10/24/22.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel:EmojiMemoryGame
//    @State var emojis = [
//        ["🚲","🚁","🚑","🛴","🛺","🚆","🚗"," 🏎","🚚","🚎","🏎"], ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏓"],["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨"]
//    ]
//
//    @State var emojiCount = 9
//    @State var emojiCat = 0
    
    var body: some View {
    
//            Text("Memorize!")
//                .font(.largeTitle)
        VStack {
            HStack {
                Text("Memorize!")
                Spacer()
                Text("Score: \(viewModel.score)")
                    
            }
            .font(.headline)
            .padding()
            
            ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]) {
                        ForEach(viewModel.cards) {card in
                            CardView(card: card)
                                .aspectRatio(2/3,contentMode: .fit)
                                .onTapGesture {
                                    viewModel.choose(card)
                                }
                        
                        }
                    }
                }
//            .foregroundColor(EmojiMemoryGame.newColor(someColor:viewModel.theme.cardColor))
            .foregroundColor(viewModel.newColor)
    //            .font(.largeTitle)
            .padding(.horizontal)
            
                
                
                Button {
                    viewModel.newGame()
                    
                } label: {
                    Text("New Game")
                        .font(.title)
                }
            
            
            
        }
//        .padding(.horizontal)

    
//    var car: some View {
//        Button {
//                emojis[0].shuffle()
//                emojiCat = 0
//
//        } label: {
//            VStack{
//                Image(systemName: "car.circle")
//                Text("Vehicles")
//                    .font(.footnote)
//            }
//        }
//    }
//
//    var sport: some View {
//        Button {
////            EmojiMemoryGame.createMemoryGame(EmojiMemoryGame.themes.shuffled())
//            viewModel.cards
//            print(viewModel.cards)
////            var viewModel:EmojiMemoryGame
////            print(EmojiMemoryGame.themes)
////            self.view.setNeedsLayout()
//        } label: {
//            VStack{
//                Image(systemName: "figure.walk.circle")
//                Text("New Game")
//                    .font(.footnote)
//            }
//
//        }
    }
//
//    var animal: some View {
//        Button {
//            emojis[2].shuffle()
//            emojiCat = 2
//        } label: {
//            VStack{
//                Image(systemName: "pawprint.circle")
//                Text("Animals")
//                    .font(.footnote)
//            }
//
//        }
//    }
    

}



struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
                    .padding(.horizontal,5)
                    .padding(.vertical)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
//        .onTapGesture {
//            isFaceUp = !isFaceUp
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel:game)
            .previewInterfaceOrientation(.portrait)
    }
}
