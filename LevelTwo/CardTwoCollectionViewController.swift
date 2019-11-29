//
//  CardCollectionViewCell.swift
//  MatchGame
//
//  Created by Erhan Acisu on 27.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit

class CardTwoCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    
    var card : Card?
    
    func setCard(_ card: Card){
        
        self.card = card
        
        if card.isMatched == true{
            backImage.alpha = 0
            frontImage.alpha = 0
            
            return
        }
        else{
            
            backImage.alpha = 1
            frontImage.alpha = 1
            
        }
        
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
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontImage, to: self.backImage, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
        
        
    }
    
    func remove() {
        
        
        
        backImage.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            
            self.frontImage.alpha = 0
            
        }, completion: nil)
        
        
    }
    
}
