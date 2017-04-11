//
//  FeedVC.swift
//  SocialNetworking
//
//  Created by Kiel Delina on 2017-04-11.
//  Copyright © 2017 Dilemma. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func signOutTapped(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        KeychainWrapper.standard.remove(key: KEY_UID)
        print("KD: ID removed")
        self.dismiss(animated: true, completion: nil)
    }
    
}
