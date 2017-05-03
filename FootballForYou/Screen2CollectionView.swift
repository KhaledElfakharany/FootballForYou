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
        
        
//        let path = Bundle.main.path(forResource: "arsenal-1", ofType: "gif")
//        let jeremyGif = UIImage.gif(data: path)
//        let jeremyGif = UIImage.animatedImage(with: [#imageLiteral(resourceName: "arsenal")], duration: 1)
//        teamLogo.image = jeremyGif
//        teamName.text = team.name

        
//        let jeremyGif = UIImage.gifImageWithName("arsenal")
//        teamLogo.image = jeremyGif
//        teamName.text = team.name
        
        let image = UIImage.gif(name: "giphy")
        teamLogo.image = image
        teamName.text = team.name
        
        
    }
    
}
