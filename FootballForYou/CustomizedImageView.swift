//
//  CustomizedImageView.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class CustomizedImageView: UIImageView {

    override func awakeFromNib() {
        layer.cornerRadius = 70
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
    }

}
