//
//  CardCollectionViewCell.swift
//  MatchGame
//
//  Created by Erhan Acisu on 27.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    
    var card : Card?
    
    func setCard(_ card: Card){
        
        self.card = card
        
        frontImage.image = UIImage(named: card.imageName)
        
        if card.isFlipped == true {
            
            UIView.transition(from: backImage, to: frontImage, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
            
        }
        else{
            
            UIView.transition(from: frontImage, to: backImage, duration: 0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            
        }
        
    }
    
    func flip(){
        
        UIView.transition(from: backImage, to: frontImage, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
    }
    
    func flipBack(){
        
        UIView.transition(from: frontImage, to: backImage, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        
    }
    
    func remove(){
        backImage.alpha = 0
        frontImage.alpha = 0
    }
    
}
