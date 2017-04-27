//
//  PostCell.swift
//  SocialNetworking
//
//  Created by Kiel Delina on 2017-04-16.
//  Copyright © 2017 Dilemma. All rights reserved.
//

import UIKit
import Firebase

class PostCell: UITableViewCell {

    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var displayPic: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var numberOfLikes: UILabel!
    @IBOutlet weak var caption: UITextView!
    
    var post: Post!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell (post: Post, img: UIImage? = nil) {
        
        self.post = post
        self.caption.text = post.caption
        self.numberOfLikes.text = "\(post.likes)"
        
        if img != nil {
            self.postImage.image = img
        } else {
            let ref = FIRStorage.storage().reference(forURL: post.imageURL)
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print ("KD: Unable to download data")
                } else {
                    print ("KD: downloaded data from Firebase Storage")
                    if let imgData = data {
                        if let img = UIImage(data: imgData) {
                            self.postImage.image = img
                            FeedVC.imageCache.setObject(img, forKey: post.imageURL as NSString)
                        }
                    }
                    
                }
            })
            
            
            
        }
        
    }

    //Download Images from Internet
    

}
