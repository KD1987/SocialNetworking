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
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //Listens to any changes in Posts Database and Getting Posts from Firebase and returns JSON
        DataServices.ds.REF_POSTS.observe(.value, with: { (snapshot) in
            print(snapshot.value)
            
            //checkking the JSON
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                //Doing a loop to see all the objects in posts and adding it to the array
                for snap in snapshot {
                    print ("KD: Snap: \(snap)")
                    if let postDict = snap.value as? Dictionary <String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                    
                }
                
            }
            self.tableView.reloadData()
            
        })
        
    }

    @IBAction func signOutTapped(_ sender: Any) {
        
        //Signing out of Fir Authorization
        try! FIRAuth.auth()?.signOut()
        //Remove KeyChain
        KeychainWrapper.standard.remove(key: KEY_UID)
        print("KD: ID removed")
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            

    }
    
    
}
