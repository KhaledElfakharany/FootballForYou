//
//  Competitions.swift
//  FootballForYou
//
//  Created by Khaled Elfakharany on 5/2/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation
import Alamofire


class Competitions {
    
    private var _name: String!
    private var _id: Int!
    
    var name : String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var id : Int {
        if _id == nil {
            _id = 0
        }
        return _id
    }
    
    init(name : String, id : Int) {
        _name = name
        _id = id
    }
    
    
}

