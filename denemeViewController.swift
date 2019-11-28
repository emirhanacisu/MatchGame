//
//  denemeViewController.swift
//  MatchGame
//
//  Created by Erhan Acisu on 29.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit
import Firebase

class denemeViewController: UIViewController {

    @IBOutlet weak var userText: UITextField!
    
    @IBOutlet weak var scoreText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func submitButton(_ sender: Any) {
        
        func postData() {
            
            let firestoreDatabase = Firestore.firestore()
                         var firestoreReference : DocumentReference? = nil
                  
                  
                  firestoreDatabase.collection("cities").document("AA").setData([
                      "name": "Los Angeles",
                      "state": "CA",
                      "country": "USA"
                  ]) { err in
                      if let err = err {
                          print("Error writing document: \(err)")
                      } else {
                          print("Document successfully written!")
                      }
                  }
            
        }
        
      
        
        
        
//        firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: ["score" : scoreText.text!], completion: { (error) in
//                   if error != nil {
//                       print("error")
//                   }
//               })
        
    }
    
   
    


}
