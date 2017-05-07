//
//  FixturesTableViewCell.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/7/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class FixturesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var homeTeamNameLbl: UILabel!
    @IBOutlet weak var awayTeamNameLbl: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var homeTeamResult: UILabel!
    @IBOutlet weak var awayTeamResult: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    
    
    func configureCell(fixture : Fixtures){
        date.text = fixture.matchDate
        homeTeamNameLbl.text = fixture.homeTeamName
        awayTeamNameLbl.text = fixture.awayTeamName
        homeTeamResult.text = fixture.homeTeamResult
        awayTeamResult.text = fixture.awayTeamResult
        matchTime.text = fixture.matchTime
        homeTeamLogo.image = UIImage(named: fixture.homeTeamName)
        awayTeamLogo.image = UIImage(named: fixture.awayTeamName)
        
    }
}
