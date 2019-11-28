//
//  LoginViewController.swift
//  MatchGame
//
//  Created by Erhan Acisu on 28.11.2019.
//  Copyright © 2019 Emirhan Acisu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    var usernameMail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInClicked(_ sender: Any) {
        
         if usernameText.text != "" && passwordText.text != "" {
                            
          usernameMail = "\(usernameText.text!)@emirhan.com"
                    
                           
          Auth.auth().signIn(withEmail: usernameMail, password: passwordText.text!) { (authdata, error) in
           if (error != nil) {
            self.showAlert("Problem Oluştu","Kullanıcı adı ve ya şifre hatalı")
            }
            else{
            print(self.usernameMail)
           self.performSegue(withIdentifier: "loginToMainVC", sender: nil)
           print("segue yap")
          }
             }
                           
           }
          else{
        showAlert("Problem Oluştu","Boş geçilemez")
      }
        
    }
    
    

    
    
    
    
    func showAlert(_ title: String, _ message: String ) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
               
        present(alert, animated: true, completion: nil)
        
    }

}
