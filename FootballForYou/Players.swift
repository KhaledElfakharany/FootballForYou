//
//  Players.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/8/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation

class Players {
    private var _name : String!
    private var _position : String!
    private var _jerseyNumber: String!
    private var _DOB: String!
    private var _nationality: String!
    private var _contract: String!
    
    var position : String {
        if _position == nil {
            _position = ""
        }
        return _position
    }
    
    var name : String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var jerseyNumber : String {
        if _jerseyNumber == nil {
            _jerseyNumber = ""
        }
        return _jerseyNumber
    }
    
    var DOB : String {
        if _DOB == nil {
            _DOB = ""
        }
        return _DOB
    }
    
    var nationality : String {
        if _nationality == nil {
            _nationality = ""
        }
        return _nationality
    }
    
    var contract : String {
        if _contract == nil {
            _contract = ""
        }
        return _contract
    }
    
    init(dict : Dictionary<String,AnyObject>) {
        
        if let name = dict["name"] as? String {
            _name = name
        }
        
        if let position = dict["position"] as? String {
            _position = position
        }
        if let jer = dict["jerseyNumber"] as? Int{
            _jerseyNumber = "\(jer)"
        }
        if let dob = dict["dateOfBirth"] as? String{
            _DOB = dob
        }
        if let nat = dict["nationality"] as? String {
            _nationality = nat
        }
        if let contract = dict["contractUntil"] as? String{
            _contract = contract
        }
        
    }
    
}
