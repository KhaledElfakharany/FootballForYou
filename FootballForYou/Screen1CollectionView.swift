//
//  Screen1CollectionView.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class Screen1CollectionView: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func updateUI(competition : Competitions){
        image.image = UIImage(named: competition.name)
//        label.text = competition.name
    }
}
