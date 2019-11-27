//
//  CardModel.swift
//  MatchGame
//
//  Created by Erhan Acisu on 27.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import Foundation

class CardModel {
    func getCards()  -> [Card] {
        var generetedCardsArray = [Card]()
        for _ in 1...8{
            
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
