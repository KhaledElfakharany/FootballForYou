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
}
