//
//  formatBtnRectangle.swift
//  SocialNetworking
//
//  Created by Kiel Delina on 2017-04-10.
//  Copyright © 2017 Dilemma. All rights reserved.
//

import UIKit

class formatBtnRectangle: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        layer.cornerRadius = 2.0
    }

}
