//
//  ViewController.swift
//  MatchGame
//
//  Created by Erhan Acisu on 26.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var  model = CardModel()
    var cardArray = [Card]()
    
    
    var firstFlipCardIndex : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        let card = cardArray[indexPath.row]
        
        cell.setCard(card)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let card = cardArray[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            
            cell.flip()
            card.isFlipped = true
            
            if firstFlipCardIndex == nil {
                firstFlipCardIndex = indexPath
                
            }
            else{
                
                checkForMatch(indexPath)
                
            }
            
        }
        
        
    }
    
    func checkForMatch(_ secondFlippedCardIndex: IndexPath){
        
        let cardOneCell = collectionView.cellForItem(at: firstFlipCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as?  CardCollectionViewCell
        
        let cardOne = cardArray[firstFlipCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
       if cardOne.imageName == cardTwo.imageName {
            
        cardOne.isMatched = true
        cardTwo.isMatched = true
        
        cardOneCell?.remove()
        cardTwoCell?.remove()
        
        }
        else{
            
        cardOne.isFlipped = false
        cardTwo.isFlipped = false
        
        cardOneCell?.flipBack()
        cardTwoCell?.flipBack()
        
        }
        
        if cardOneCell == nil{
            
            collectionView.reloadItems(at: [firstFlipCardIndex!])
            
        }
        
        firstFlipCardIndex = nil
        
    }
    
}



