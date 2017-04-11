//
//  ViewController.swift
//  SocialNetworking
//
//  Created by Kiel Delina on 2017-04-08.
//  Copyright © 2017 Dilemma. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase


class MainVC: UIViewController {

    
    @IBOutlet weak var emailField: formatText!
    
    @IBOutlet weak var passwordField: formatText!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func FBBtnTapped(_ sender: Any) {
        
        let FBLogin = FBSDKLoginManager()
        
        FBLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print ("KD: Unable to authenticate with Facebook")
            } else if result?.isCancelled == true {
                print ("KD: User cancelled FB authentication")
            } else {
                print ("KD: Successful FB authentication")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    
    }
    
        func firebaseAuth(_ credential: FIRAuthCredential) {
            
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                if error != nil {
                    print ("KD: unable to authenticate with Firebase")
                } else {
                    print ("KD: Successful authentication with Firebase")
                }
            })
            
        }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if let email = emailField.text, let pwd = passwordField.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print ("Successfully Authenticated to Firebase via email")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print ("KD: unable to authenticate user with Firebase using email")
                        } else {
                            print ("KD: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
            
        }
        
    }

}

