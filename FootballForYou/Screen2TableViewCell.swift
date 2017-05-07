//
//  Screen2TableViewCell.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/6/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class Screen2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var positionLbl: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var playedLbl: UILabel!
    @IBOutlet weak var winLbl: UILabel!
    @IBOutlet weak var drawLbl: UILabel!
    @IBOutlet weak var loseLbl: UILabel!
    @IBOutlet weak var goalScored: UILabel!
    @IBOutlet weak var goalAgainst: UILabel!
    @IBOutlet weak var goalDiff: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var teamNameLbl: UILabel!

    
    func configureCell(team : Teams){
        positionLbl.text = team.position
        teamImage.image = UIImage(named: team.name)
        playedLbl.text = team.playedGames
        winLbl.text = team.wins
        drawLbl.text = team.draws
        loseLbl.text = team.losses
        goalScored.text = team.goals
        goalAgainst.text = team.goalAgainst
        goalDiff.text = team.goalDiff
        pointsLbl.text = team.points
        teamNameLbl.text = team.name
    }

}
