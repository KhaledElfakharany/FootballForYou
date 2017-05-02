//
//  shadedViewForCollectionView.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class shadedViewForCollectionView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = self.frame.width/2
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0 , height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
    }

}
