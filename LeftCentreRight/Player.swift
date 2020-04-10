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
    var field: Stash = Stash(initialCoins: [])
    var hasCoinsInField : Bool {
        
        var hasCoins : Bool
        
        if field.collectionOfCoins.count > 0 {
            hasCoins = true
        } else {
            hasCoins = false
        }
        return hasCoins
    }
    
    //initializer
    init(collection: Stash, name: String) {
        self.collection = collection
        self.name = name
    }
    
    //function to return how many dice should be rolled depending on coins in field
    func diceToRoll() -> Int {
        
        var number : Int = 0
        
        if field.collectionOfCoins.count <= 0 {
            number = 0
        } else if field.collectionOfCoins.count == 1 || field.collectionOfCoins.count == 2 || field.collectionOfCoins.count == 3 {
            number = field.collectionOfCoins.count
        } else if field.collectionOfCoins.count > 3 {
            number = 3
        }
        return number
    }
    
}


