//
//  PlayersCollectionViewCell.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/8/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class PlayersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerNameLbl: UILabel!
    
    func configureCell(player : Players){
        playerNameLbl.text = player.name
        playerImage.image = UIImage(named: player.name)
    }
}
