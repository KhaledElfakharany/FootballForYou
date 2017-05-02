//
//  Screen2.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Alamofire

class Screen2: UIViewController {
    
    var competitionId : Int!
    var teams = [Teams]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadTeams {
            for team in self.teams {
                print("\(team.name) .... \(team.logoURL) .... \(team.playersURL) ..... \(team.fixturesURL) ")
            }
        }
    }
    
    func downloadTeams(completed: @escaping ()->()){
        let path = "http://api.football-data.org/v1/competitions/\(competitionId!)/teams"
        Alamofire.request(path).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let teams = dict["teams"] as? [Dictionary<String,AnyObject>] {
                    for team in teams {
                        if let name = team["name"] as? String {
                            if let url = team["crestUrl"] as? String {
                                if let link = team["_links"] as? Dictionary<String,AnyObject>{
                                    if let fixtures = link["fixtures"] as? Dictionary<String,AnyObject>{
                                        if let href1 = fixtures["href"] as? String{
                                            if let players = link["players"] as? Dictionary<String,AnyObject>{
                                                if let href2 = players["href"] as? String{
                                                    let team = Teams(name: name, URL: url, playersURL : href2, fixturesURL : href1)
                                                    self.teams.append(team)
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                completed()
            }
        }
    }
}
