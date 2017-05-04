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
        
        
        
        
//        if let url = URL(string: team.logoURL) {
//
//            DispatchQueue.global().async {
//                do {
//                    let data = try Data(contentsOf: url)
//                    DispatchQueue.global().sync {
//                        self.teamLogo.image = UIImage(data: data)
//                    }
//                } catch  {
//                    //handle the error
//                }
//            }
//            
//        }
        
        
        let image = UIImage(named: team.name)
        teamLogo.image = image
        teamName.text = team.name
        
        
    }
    
}
