//
//  ContentView.swift
//  Memorize
//
//  Created by Sean Curry on 10/24/22.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var viewModel:EmojiMemoryGame

    
    var body: some View {

        VStack {
            HStack {
                Text("Memorize...\(viewModel.themeName)!")
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

            .foregroundColor(viewModel.newColor)
            .padding(.horizontal)
            
                
                
                Button {
                    viewModel.newGame()
                    
                } label: {
                    Text("New Game")
                        .font(.title)
                }
            
            
            
        }

    }
    

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

    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel:game)
            .previewInterfaceOrientation(.portrait)
    }
}
