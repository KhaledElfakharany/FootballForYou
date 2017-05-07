//
//  Fixtures.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/7/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation

class Fixtures {
    
    private var _homeTeamName: String!
    private var _awayTeamName: String!
    private var _matchDate: String!
    private var _matchTime: String!
    private var _homeTeamResult: String!
    private var _awayTeamResult: String!
    private var _status: String!
    private var _matchDay: Int!
    
    var matchDay : Int {
        get {
            if _matchDay == nil {
                _matchDay = 0
            }
            return _matchDay
        } set {
            _matchDay = newValue
        }
    }
    
    var status : String {
        if _status == nil {
            _status = ""
        }
        return _status
    }
    
    var homeTeamName : String {
        if _homeTeamName == nil {
            _homeTeamName = ""
        }
        return _homeTeamName
    }
    
    var awayTeamName : String {
        if _awayTeamName == nil {
            _awayTeamName = ""
        }
        return _awayTeamName
    }
    
    var matchDate : String {
        if _matchDate == nil {
            _matchDate = ""
        }
        return _matchDate
    }
    
    var matchTime : String {
        if _matchTime == nil {
            _matchTime = ""
        }
        return _matchTime
    }
    
    var homeTeamResult : String {
        if _homeTeamResult == nil {
            _homeTeamResult = ""
        }
        return _homeTeamResult
    }
    
    var awayTeamResult : String {
        if _awayTeamResult == nil {
            _awayTeamResult = ""
        }
        return _awayTeamResult
    }
    
    
    
    init(tableInfo : Dictionary<String,AnyObject>) {
        if let homeTeamName = tableInfo["homeTeamName"] as? String {
            _homeTeamName = homeTeamName
        }
        if let awayTeamName = tableInfo["awayTeamName"] as? String {
            _awayTeamName = awayTeamName
        }
        if let date = tableInfo["date"] as? String {
            let toIndex = date.index(date.startIndex, offsetBy: 10)
            let dayDate = date.substring(to: toIndex)
            let fromIndex = date.index(date.startIndex, offsetBy: 11)
            var time = date.substring(from: fromIndex)
            let toIndex2 = date.index(time.endIndex, offsetBy: -4)
            time = time.substring(to: toIndex2)
            
            _matchDate = dayDate
            _matchTime = time
        }

        if let result = tableInfo["result"] as? Dictionary<String,AnyObject>{
            if let homeTeamResult = result["goalsHomeTeam"] as? Int {
                _homeTeamResult = "\(homeTeamResult)"
            }
            if let awayTeamResult = result["goalsAwayTeam"] as? Int {
                _awayTeamResult = "\(awayTeamResult)"
            }
        }
        
        if let status = tableInfo["status"] as? String{
            _status = status
        }
        
        if let matchDay = tableInfo["matchday"] as? Int {
            _matchDay = matchDay
        }
        
    }
    
    
    
}
