//
//  CardModel.swift
//  MatchGame
//
//  Created by Erhan Acisu on 27.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import Foundation

class CardModelFour {
    func getCards()  -> [Card] {
        var generetedCardsArray = [Card]()
<<<<<<< HEAD:LevelOne/CardModel.swift
        for _ in 1...3{
=======
        for _ in 1...2{
>>>>>>> a130c220f91cffd56e07fa70ceaf2dd4e1728dc2:CardModel.swift
            
           let randomNumber =  arc4random_uniform(13) + 1
            
            print(randomNumber)
            
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generetedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generetedCardsArray.append(cardTwo)
        }
        return generetedCardsArray
    }
}
