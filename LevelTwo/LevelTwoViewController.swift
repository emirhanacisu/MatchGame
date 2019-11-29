//
//  ViewController.swift
//  MatchGame
//
//  Created by Erhan Acisu on 26.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit

class LevelTwoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    var gelenTime = Float()
    

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var  model = CardModelTwo()
    var cardArray = [Card]()
    
    
    var firstFlipCardIndex : IndexPath?
    
    var timer : Timer?
    var milliseconds:Float = 10 * 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }

   @objc func timerElapsed() {
        gelenTime -= 1
    let seconds = String(format: "%.2f", gelenTime/1000)
    timeLabel.text = "Kalan Süre: \(seconds)"
    
    if gelenTime <= 0 {
       
        
        
        timer?.invalidate()
        timeLabel.textColor = UIColor.red
        checkGameEnded()
        
        
    }
    
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
        
        if gelenTime <= 0 {
            
            return
            
        }
        
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
        
        checkGameEnded()
        
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
    
    func checkGameEnded() {
        
       var isWon = true
        
        for card in cardArray{
            
            if card.isMatched == false {
                
            isWon = false
            break
            
            }
        }
        
        var title = ""
        var message = ""
        
        
        if isWon == true {
            
            if gelenTime > 0{
                timer?.invalidate()
            }
            title = "Tebrikler"
            message = "Kazandınız"
            
            showLevelUpAlert("Tebrikler", "level atladınız")
        }
        else {
            
            
            if milliseconds > 0{
                
                return
                
            }
            
            title = "Game Over"
            message = "Kaybettiniz"
            
            
        }
       
        //showAlert(title, message)
       
    }
    
    func showAlert(_ title: String, _ message: String ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
               
        present(alert, animated: true, completion: nil)
        
    }
    
    func showLevelUpAlert(_ title: String, _ message: String ) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
  //  alert.addAction(alertAction)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
              print("Handle Ok logic here")
                  self.performSegue(withIdentifier: "levelTwotoLevelThreeVC", sender: nil)
              }))
                 
              present(alert, animated: true) {
                  print("level up")
        
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var gonderSegue = segue.destination as! LevelThreeViewController
        gonderSegue.gelenTime = self.gelenTime
    }
    
    
}



