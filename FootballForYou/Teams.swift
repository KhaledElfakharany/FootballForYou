//
//  Teams.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation
import Alamofire

class Teams {
    private var _name : String!
    private var _logoURL : String!
    private var _fixturesURL : String!
    private var _playersURL : String!
    
    private var _playedGames: String!
    private var _points: String!
    private var _goals: String!
    private var _goalAgainst: String!
    private var _goalDiff: String!
    private var _wins: String!
    private var _draws: String!
    private var _losses: String!
    private var _position: String!
    
    
    var position : String {
        if _position == nil {
            _position = ""
        }
        return _position
    }
    var playedGames : String {
        if _playedGames == nil {
            _playedGames = ""
        }
        return _playedGames
    }
    var points : String {
        if _points == nil {
            _points = ""
        }
        return _points
    }
    var goals : String {
        if _goals == nil {
            _goals = ""
        }
        return _goals
    }
    var goalAgainst : String {
        if _goalAgainst == nil {
            _goalAgainst = ""
        }
        return _goalAgainst
    }
    
    var goalDiff : String {
        if _goalDiff == nil {
            _goalDiff = ""
        }
        return _goalDiff
    }
    var wins : String {
        if _wins == nil {
            _wins = ""
        }
        return _wins
    }
    var draws : String {
        if _draws == nil {
            _draws = ""
        }
        return _draws
    }
    var losses : String {
        if _losses == nil {
            _losses = ""
        }
        return _losses
    }
    var name : String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    var logoURL : String {
        if _logoURL == nil {
            _logoURL = ""
        }
        return _logoURL
    }
    var playersURL : String {
        if _playersURL == nil {
            _playersURL = ""
        }
        return _playersURL
    }
    
    var fixturesURL : String {
        if _fixturesURL == nil {
            _fixturesURL = ""
        }
        return _fixturesURL
    }
    init(team : Dictionary<String,AnyObject>) {
                if let name = team["name"] as? String {
                        if let link = team["_links"] as? Dictionary<String,AnyObject>{
                            if let fixtures = link["fixtures"] as? Dictionary<String,AnyObject>{
                                if let href1 = fixtures["href"] as? String{
                                    if let players = link["players"] as? Dictionary<String,AnyObject>{
                                        if let href2 = players["href"] as? String{
                                            _name = name
                                            _playersURL = href2
                                            _fixturesURL = href1
                                        }
                                    }
                                }
                            }                            
                        }
                }
    }
    
    init(tableInfo : Dictionary<String,AnyObject>) {
        if let teamName = tableInfo["teamName"] as? String {
            _name = teamName
        }
        if let position = tableInfo["position"] as? Int {
            _position = "\(position)"
        }
        if let playedGames = tableInfo["playedGames"] as? Int {
            _playedGames = "\(playedGames)"
        }
        if let points = tableInfo["points"] as? Int {
            _points = "\(points)"
        }
        if let goals = tableInfo["goals"] as? Int {
            _goals = "\(goals)"
        }
        if let goalsAgainst = tableInfo["goalsAgainst"] as? Int {
            _goalAgainst = "\(goalsAgainst)"
        }
        if let goalDifference = tableInfo["goalDifference"] as? Int {
            _goalDiff = "\(goalDifference)"
        }
        if let wins = tableInfo["wins"] as? Int {
            _wins = "\(wins)"
        }
        if let draws = tableInfo["draws"] as? Int {
            _draws = "\(draws)"
        }
        if let losses = tableInfo["losses"] as? Int {
            _losses = "\(losses)"
        }
    }
}
