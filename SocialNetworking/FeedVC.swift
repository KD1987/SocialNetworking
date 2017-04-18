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

class FeedVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @IBAction func signOutTapped(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        KeychainWrapper.standard.remove(key: KEY_UID)
        print("KD: ID removed")
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            

    }
    
    
}
