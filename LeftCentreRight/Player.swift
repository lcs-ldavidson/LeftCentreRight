//
//  Player.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-04-09.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

//class for a player
class Player {
    
    //properties
    var collection : Stash
    var name : String
    
    //initializer
    init(collection: Stash, name: String) {
        self.collection = collection
        self.name = name
    }
    
}


