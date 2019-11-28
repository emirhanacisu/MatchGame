//
//  MainViewController.swift
//  MatchGame
//
//  Created by Erhan Acisu on 28.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    @IBOutlet weak var userText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    
   var userMail = Auth.auth().currentUser?.email as? String

 
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

getDataFromDatabase()
    }
    
   
    
    func getDataFromDatabase () {
        
        
        
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Posts").addSnapshotListener { (snapshot, error) in
            if error != nil {
                print("cekemedi")
            }
            else {
                if snapshot?.isEmpty != true && snapshot != nil{
                    for document in snapshot!.documents {
                        
                        let documentID = document.documentID
                        
                        if documentID == self.userMail {
                            
                            let array = self.userMail?.components(separatedBy: "@")
                            self.userText.text = array?[0]as! String
                                
                        if let score = document.get("score") as? String {
                            self.scoreText.text = score
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func devam(_ sender: Any) {
        performSegue(withIdentifier: "denemeVC", sender: nil)
        
    }
    
}
