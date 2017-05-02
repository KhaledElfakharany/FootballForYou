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
    
    
    
    init(name: String, URL : String , playersURL : String , fixturesURL : String) {
        _name = name
        _logoURL = URL
        _playersURL = playersURL
        _fixturesURL = fixturesURL
    }
}
