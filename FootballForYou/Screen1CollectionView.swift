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
    
    func updateUI(competition : Competitions){
        image.image = UIImage(named: competition.name)
    }
}
