//
//  PostCell.swift
//  SocialNetworking
//
//  Created by Kiel Delina on 2017-04-16.
//  Copyright © 2017 Dilemma. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var displayPic: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var numberOfLikes: UILabel!
    @IBOutlet weak var caption: UITextView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
