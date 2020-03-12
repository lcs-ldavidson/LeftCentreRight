//
//  Stash.swift
//  LeftCentreRight
//
//  Created by Davidson, Liam on 2020-03-11.
//  Copyright © 2020 Davidson, Liam. All rights reserved.
//

import Foundation

//structure for a collection of coins
struct Stash {
    
    //the array of coins that is contained in the stash
    var collectionOfCoins : [Coin]
    
    //returns the total value of all coins in the stash
    var totalMonetaryValue : Double {
        var total = 0.0
        for moneyValue in collectionOfCoins {
            total += moneyValue.value
        }
        return total
    }
    
    //returns a description of each coin in the stash
    var stashDescription : String {
        var description = ""
        for coin in collectionOfCoins {
            description += coin.description
        }
        return description
    }
    
    
    
}
