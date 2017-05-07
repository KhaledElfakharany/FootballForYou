//
//  Screen2CollectionView.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class Screen2CollectionView: UICollectionViewCell {
    
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    func updateUI(team : Teams) {
        
        let image = UIImage(named: team.name)
        teamLogo.image = image
        teamName.text = team.name
        
        
    }
    
}
